# Exercise 04: S3 Lifecycle Rules
# Complete the TODOs to add lifecycle configuration

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

# S3 bucket (provided)
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

# Versioning (required for noncurrent version expiration)
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.exercise_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# TODO: Add lifecycle configuration resource
# - Resource type: aws_s3_bucket_lifecycle_configuration
# - Local name: bucket_lifecycle
# - Reference the bucket
# - Create two rules:
#   1. Transition current objects to STANDARD_IA after 30 days
#   2. Expire noncurrent versions after 90 days

# resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
#   bucket = ???
#
#   # Rule 1: Transition to Infrequent Access
#   rule {
#     id     = "???"
#     status = "???"
#
#     transition {
#       days          = ???
#       storage_class = "???"
#     }
#   }
#
#   # Rule 2: Expire old versions
#   rule {
#     id     = "???"
#     status = "???"
#
#     noncurrent_version_expiration {
#       noncurrent_days = ???
#     }
#   }
# }
