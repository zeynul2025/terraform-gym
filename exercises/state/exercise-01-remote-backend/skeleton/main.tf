# Exercise 01: Remote State Backend

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # TODO: After creating state bucket, uncomment and configure this backend
  # backend "s3" {
  #   bucket         = "terraform-state-YOUR-ACCOUNT-ID"
  #   key            = "gym/state/exercise-01/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   use_lockfile   = true  # Terraform 1.9+ native locking!
  # }
}

provider "aws" {
  region = var.region
}

# Step 1: Deploy this resource with LOCAL state first
resource "aws_s3_bucket" "test_resource" {
  bucket        = "terraform-gym-state-test-${var.student_name}"
  force_destroy = true

  tags = {
    Name        = "State Exercise 01 Test Bucket"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# TODO: After Step 1, create state bucket manually or with separate config
# Then uncomment backend above and run: terraform init -migrate-state
