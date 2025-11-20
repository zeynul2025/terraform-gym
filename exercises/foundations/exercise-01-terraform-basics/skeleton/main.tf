# Exercise 01: Terraform Basics
# Your first Terraform configuration!

# TODO: Add terraform block
# Required version: >= 1.9.0
# Required provider: aws from hashicorp/aws, version ~> 5.0

# terraform {
#   required_version = "???"
#
#   required_providers {
#     ??? = {
#       source  = "???"
#       version = "???"
#     }
#   }
# }

# TODO: Add provider block for AWS
# Region: us-east-1

# provider "???" {
#   region = "???"
# }

# TODO: Add resource block for S3 bucket
# Resource type: aws_s3_bucket
# Resource name: my_first_bucket
# Bucket name: terraform-gym-first-YOURNAME (must be globally unique!)
# Add tags: Name, Environment, ManagedBy

# resource "aws_s3_bucket" "my_first_bucket" {
#   bucket = "???"
#
#   tags = {
#     Name        = "???"
#     Environment = "???"
#     ManagedBy   = "???"
#   }
# }

# After completing:
# 1. Run: terraform init
# 2. Run: terraform fmt
# 3. Run: terraform validate
# 4. Run: terraform plan
# 5. Run: terraform apply
# 6. Verify in AWS Console or: aws s3 ls
# 7. Run: terraform destroy
