# Exercise 02: State Commands - Solution

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

# Multiple resources to practice state commands on
resource "aws_s3_bucket" "bucket_alpha" {
  bucket        = "terraform-gym-alpha-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "Alpha Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "bucket_beta" {
  bucket        = "terraform-gym-beta-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "Beta Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "bucket_gamma" {
  bucket        = "terraform-gym-gamma-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "Gamma Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# IAM user to practice state commands
resource "aws_iam_user" "test_user" {
  name = "terraform-gym-state-user-${var.student_name}"

  tags = {
    Name        = "State Commands Test User"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
