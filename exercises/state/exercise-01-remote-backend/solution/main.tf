# Exercise 01: Remote State Backend - Solution

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend configuration - commented for standalone testing
  # In production, uncomment this after creating the state bucket
  # backend "s3" {
  #   bucket         = "terraform-state-<YOUR-ACCOUNT-ID>"
  #   key            = "gym/state/exercise-01/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   use_lockfile   = true  # Terraform 1.9+ native locking (no DynamoDB needed!)
  # }
}

provider "aws" {
  region = var.region
}

# Data source to get account ID
data "aws_caller_identity" "current" {}

# Create S3 bucket for state storage
resource "aws_s3_bucket" "state_bucket" {
  bucket        = "terraform-state-${data.aws_caller_identity.current.account_id}-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
    Purpose     = "State Storage"
  }
}

# Enable versioning on state bucket (recommended)
resource "aws_s3_bucket_versioning" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable encryption on state bucket (required for security)
resource "aws_s3_bucket_server_side_encryption_configuration" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access to state bucket (critical security)
resource "aws_s3_bucket_public_access_block" "state_bucket" {
  bucket = aws_s3_bucket.state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Test resource to demonstrate state management
resource "aws_s3_bucket" "test_resource" {
  bucket        = "terraform-gym-state-test-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "State Exercise 01 Test Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
