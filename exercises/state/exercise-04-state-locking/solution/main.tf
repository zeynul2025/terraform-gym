# Exercise 04: State Locking & Troubleshooting - Solution

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Backend with state locking enabled (for demonstration)
  # Uncomment after creating state bucket
  # backend "s3" {
  #   bucket         = "terraform-state-<YOUR-ACCOUNT-ID>"
  #   key            = "gym/state/exercise-04/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   use_lockfile   = true  # Terraform 1.9+ native S3 locking
  # }
}

provider "aws" {
  region = var.region
}

# Resources for testing state locking behavior
resource "aws_s3_bucket" "bucket_one" {
  bucket        = "terraform-gym-locking-1-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "State Locking Test Bucket 1"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "bucket_two" {
  bucket        = "terraform-gym-locking-2-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "State Locking Test Bucket 2"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Resource with sleep to simulate long-running operation
# Useful for testing concurrent operations and lock behavior
resource "aws_iam_user" "test_user" {
  name = "terraform-gym-locking-user-${var.student_name}"

  tags = {
    Name        = "State Locking Test User"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Slow resource for locking tests
resource "aws_iam_user_policy" "test_policy" {
  name = "test-policy"
  user = aws_iam_user.test_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:ListBucket"
        Resource = "*"
      }
    ]
  })
}
