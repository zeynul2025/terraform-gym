# Exercise 03: IAM Groups - Solution

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

resource "aws_iam_group" "developers" {
  name = "terraform-gym-developers-${var.student_name}"
}

resource "aws_iam_group" "admins" {
  name = "terraform-gym-admins-${var.student_name}"
}

resource "aws_iam_user" "dev_user" {
  name = "terraform-gym-dev-${var.student_name}"
  tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_user" "admin_user" {
  name = "terraform-gym-admin-${var.student_name}"
  tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_group_membership" "dev_team" {
  name  = "dev-team-membership"
  group = aws_iam_group.developers.name
  users = [aws_iam_user.dev_user.name]
}

resource "aws_iam_group_membership" "admin_team" {
  name  = "admin-team-membership"
  group = aws_iam_group.admins.name
  users = [aws_iam_user.admin_user.name]
}

resource "aws_iam_group_policy_attachment" "dev_readonly" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "admin_power" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}
