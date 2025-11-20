# Exercise 02: IAM Roles and Policies

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

# TODO: Create IAM role for EC2
# - Resource type: aws_iam_role
# - Name: terraform-gym-ec2-role-${var.student_name}
# - assume_role_policy allows ec2.amazonaws.com to assume the role

# resource "aws_iam_role" "ec2_role" {
#   name = "???"
#
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "???"
#         Principal = {
#           Service = "???"
#         }
#         Action = "???"
#       }
#     ]
#   })
#
#   tags = {
#     Name         = "???"
#     Environment  = "Learning"
#     ManagedBy    = "Terraform"
#     Student      = var.student_name
#     AutoTeardown = "1h"
#   }
# }

# TODO: Create inline policy for S3 read access
# - Resource type: aws_iam_role_policy
# - Allow s3:GetObject and s3:ListBucket on all resources

# resource "aws_iam_role_policy" "s3_read_policy" {
#   name = "s3-read-access"
#   role = ???
#
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "???"
#         Action = [
#           "???",
#           "???"
#         ]
#         Resource = "???"
#       }
#     ]
#   })
# }
