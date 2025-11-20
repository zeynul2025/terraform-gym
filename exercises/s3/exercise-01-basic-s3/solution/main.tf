# Exercise 01: Basic S3 Bucket - Solution

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

resource "aws_s3_bucket" "exercise_bucket" {
  bucket        = "terraform-gym-01-${var.student_name}"
  force_destroy = true

  tags = {
    Name         = "Exercise 01 S3 Bucket"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}
