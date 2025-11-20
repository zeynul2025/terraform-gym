# S3 Challenge: Production-Ready S3 Bucket - Solution

terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# Data source for AWS account ID
data "aws_caller_identity" "current" {}

# Log bucket (must be created first)
resource "aws_s3_bucket" "log_bucket" {
  bucket        = "terraform-gym-challenge-${var.student_name}-logs"
  force_destroy = true

  # Object lock NOT required for log bucket
  tags = {
    Name         = "S3 Challenge Log Bucket"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}

# Allow S3 to write logs to this bucket using a bucket policy
resource "aws_s3_bucket_policy" "log_bucket_policy" {
  bucket = aws_s3_bucket.log_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "S3ServerAccessLogsPolicy"
        Effect = "Allow"
        Principal = {
          Service = "logging.s3.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${aws_s3_bucket.log_bucket.arn}/*"
      }
    ]
  })
}

# Main S3 bucket with object lock enabled
resource "aws_s3_bucket" "exercise_bucket" {
  bucket              = "terraform-gym-challenge-${var.student_name}"
  force_destroy       = true
  object_lock_enabled = true

  tags = {
    Name         = "S3 Challenge Production Bucket"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}

# Versioning (required for object lock)
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.exercise_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.exercise_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "bucket_pab" {
  bucket = aws_s3_bucket.exercise_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Bucket policy
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.exercise_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowAccountFullAccess"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.exercise_bucket.arn,
          "${aws_s3_bucket.exercise_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Lifecycle configuration with all 4 rules
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.exercise_bucket.id

  # Depends on versioning being enabled
  depends_on = [aws_s3_bucket_versioning.bucket_versioning]

  # Rule 1: Transition to IA after 30 days
  rule {
    id     = "transition-to-ia"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  # Rule 2: Transition to Glacier after 90 days
  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }

  # Rule 3: Expire noncurrent versions after 60 days
  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 60
    }
  }

  # Rule 4: Abort incomplete multipart uploads after 7 days
  rule {
    id     = "abort-incomplete-uploads"
    status = "Enabled"

    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}

# Access logging configuration
resource "aws_s3_bucket_logging" "bucket_logging" {
  bucket = aws_s3_bucket.exercise_bucket.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "access-logs/"
}

# Object lock configuration (default retention)
resource "aws_s3_bucket_object_lock_configuration" "bucket_object_lock" {
  bucket = aws_s3_bucket.exercise_bucket.id

  # Depends on object_lock_enabled = true in bucket
  rule {
    default_retention {
      mode = "GOVERNANCE"
      days = 30
    }
  }
}
