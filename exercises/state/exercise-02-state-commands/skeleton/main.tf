# Exercise 02: State Commands

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

# TODO: Deploy these resources, then practice state commands

resource "aws_s3_bucket" "bucket_alpha" {
  bucket        = "terraform-gym-alpha-${var.student_name}"
  force_destroy = true
  tags = {
    Name = "Alpha Bucket"
  }
}

resource "aws_s3_bucket" "bucket_beta" {
  bucket        = "terraform-gym-beta-${var.student_name}"
  force_destroy = true
  tags = {
    Name = "Beta Bucket"
  }
}

# After deploying, practice:
# 1. terraform state list
# 2. terraform state show aws_s3_bucket.bucket_alpha
# 3. terraform state mv aws_s3_bucket.bucket_alpha aws_s3_bucket.bucket_renamed
#    (Then update this file to match!)
# 4. terraform state rm aws_s3_bucket.bucket_beta
#    (Removes from state but leaves in AWS)
