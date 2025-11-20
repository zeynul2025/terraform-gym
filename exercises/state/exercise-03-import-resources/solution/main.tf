# Exercise 03: Importing Existing Resources - Solution

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

# This solution creates resources that could be imported in a real scenario
# In practice, you would:
# 1. Create these resources manually (aws cli or console)
# 2. Write terraform configuration for them
# 3. Import them into state

# Resource that demonstrates what you'd import (legacy method)
resource "aws_s3_bucket" "example_legacy" {
  bucket        = "terraform-gym-import-legacy-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "Example for Legacy Import"
    Environment = "Learning"
    ManagedBy   = "Terraform"
    ImportMethod = "Legacy CLI"
  }
}

# Resource that demonstrates modern import blocks (Terraform 1.5+)
resource "aws_s3_bucket" "example_modern" {
  bucket        = "terraform-gym-import-modern-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "Example for Modern Import"
    Environment = "Learning"
    ManagedBy   = "Terraform"
    ImportMethod = "Import Block"
  }
}

# IAM role to demonstrate importing different resource types
resource "aws_iam_role" "example_role" {
  name = "terraform-gym-import-role-${var.student_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "Example IAM Role for Import"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Example import block syntax (commented for reference)
# To use this in practice:
# 1. Create resource in AWS manually
# 2. Add import block like this
# 3. Add resource block with matching configuration
# 4. Run terraform plan to see the import
# 5. Run terraform apply to perform the import

# import {
#   to = aws_s3_bucket.imported_bucket
#   id = "actual-bucket-name-in-aws"
# }
#
# resource "aws_s3_bucket" "imported_bucket" {
#   bucket = "actual-bucket-name-in-aws"
#   # ... rest of configuration matching actual resource
# }
