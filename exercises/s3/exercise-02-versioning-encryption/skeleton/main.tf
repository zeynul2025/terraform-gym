# Exercise 02: S3 Bucket with Versioning and Encryption
# Complete the TODOs to add versioning and encryption

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

# This bucket is already created for you
resource "aws_s3_bucket" "exercise_bucket" {
  bucket        = "terraform-gym-02-${var.student_name}"
  force_destroy = true

  tags = {
    Name         = "Exercise 02 S3 Bucket"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}

# TODO: Add versioning resource
# - Resource type: aws_s3_bucket_versioning
# - Local name: bucket_versioning
# - Reference the bucket using: aws_s3_bucket.exercise_bucket.id
# - Enable versioning with status = "Enabled"
# - Use a versioning_configuration block

# resource "aws_s3_bucket_versioning" "bucket_versioning" {
#   bucket = ???
#
#   versioning_configuration {
#     status = "???"
#   }
# }

# TODO: Add encryption resource
# - Resource type: aws_s3_bucket_server_side_encryption_configuration
# - Local name: bucket_encryption
# - Reference the bucket using: aws_s3_bucket.exercise_bucket.id
# - Use AES256 algorithm
# - Requires nested blocks: rule { apply_server_side_encryption_by_default { ... } }

# resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
#   bucket = ???
#
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "???"
#     }
#   }
# }
