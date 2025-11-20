# Exercise 04: S3 Lifecycle Rules - Solution

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

# S3 bucket
resource "aws_s3_bucket" "exercise_bucket" {
  bucket        = "terraform-gym-04-${var.student_name}"
  force_destroy = true

  tags = {
    Name         = "Exercise 04 S3 Bucket with Lifecycle"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}

# Enable versioning (required for noncurrent version expiration)
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.exercise_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Lifecycle configuration
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.exercise_bucket.id

  # Rule 1: Transition to Infrequent Access after 30 days
  rule {
    id     = "transition-to-ia"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  # Rule 2: Expire noncurrent versions after 90 days
  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}
