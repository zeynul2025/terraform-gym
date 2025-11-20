# Exercise 01: Terraform Basics - Solution

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
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket        = "terraform-gym-first-yourname" # Change to your unique name
  force_destroy = true

  tags = {
    Name        = "My First Terraform Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
