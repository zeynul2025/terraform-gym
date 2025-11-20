# Exercise 03: S3 Bucket Policies
# Complete the TODOs to add a bucket policy and public access block

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

# S3 bucket (provided)
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

# TODO: Add bucket policy resource
# - Resource type: aws_s3_bucket_policy
# - Local name: bucket_policy
# - Reference the bucket using: aws_s3_bucket.exercise_bucket.id
# - Use jsonencode() to create the policy
# - Allow s3:GetObject and s3:ListBucket actions
# - Principal should be your AWS account root
# - Resources should include both bucket ARN and bucket ARN/*

# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = ???
#
#   policy = jsonencode({
#     Version = "???"
#     Statement = [
#       {
#         Sid    = "AllowAccountAccess"
#         Effect = "???"
#         Principal = {
#           AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
#         }
#         Action = [
#           "???",
#           "???"
#         ]
#         Resource = [
#           ???,
#           ???
#         ]
#       }
#     ]
#   })
# }

# TODO: Add public access block resource
# - Resource type: aws_s3_bucket_public_access_block
# - Local name: bucket_pab
# - Set all four settings to true

# resource "aws_s3_bucket_public_access_block" "bucket_pab" {
#   bucket = ???
#
#   block_public_acls       = ???
#   block_public_policy     = ???
#   ignore_public_acls      = ???
#   restrict_public_buckets = ???
# }
