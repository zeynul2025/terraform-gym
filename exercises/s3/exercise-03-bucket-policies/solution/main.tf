# Exercise 03: S3 Bucket Policies - Solution

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

# Data source to get current AWS account ID
data "aws_caller_identity" "current" {}

# S3 bucket
resource "aws_s3_bucket" "exercise_bucket" {
  bucket        = "terraform-gym-03-${var.student_name}"
  force_destroy = true

  tags = {
    Name         = "Exercise 03 S3 Bucket with Policy"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}

# Bucket policy allowing account access
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.exercise_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowAccountAccess"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.exercise_bucket.arn,
          "${aws_s3_bucket.exercise_bucket.arn}/*"
        ]
      }
    ]
  })
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "bucket_pab" {
  bucket = aws_s3_bucket.exercise_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
