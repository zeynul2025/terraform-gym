# Exercise 01: Basic IAM User - Solution

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

resource "aws_iam_user" "exercise_user" {
  name = "terraform-gym-user-${var.student_name}"

  tags = {
    Name         = "IAM Exercise 01 User"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}

# WARNING: Creating IAM access keys is a security anti-pattern!
# This is for LEARNING PURPOSES ONLY. In production, use IAM roles instead.
# Access keys will be stored in Terraform state - destroy immediately after exercise.
resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.exercise_user.name
}

resource "aws_iam_user_policy_attachment" "readonly_policy" {
  user       = aws_iam_user.exercise_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}
