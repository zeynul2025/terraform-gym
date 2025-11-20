# Exercise 01: Basic S3 Bucket
# Complete the TODOs below to create a working Terraform configuration

# TODO: Add terraform block with:
#   - required_version >= 1.9.0
#   - required_providers for AWS (~> 5.0)

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
#   - Set region to "us-east-1"

# provider "???" {
#   region = "???"
# }

# TODO: Create an S3 bucket resource
#   - Resource type: aws_s3_bucket
#   - Local name: exercise_bucket
#   - Bucket name: terraform-gym-01-${var.student_name}
#   - Add all 5 required tags (Name, Environment, ManagedBy, Student, AutoTeardown)

# resource "aws_s3_bucket" "exercise_bucket" {
#   bucket = "???"
#
#   tags = {
#     Name         = "???"
#     Environment  = "???"
#     ManagedBy    = "???"
#     Student      = "???"
#     AutoTeardown = "???"
#   }
# }
