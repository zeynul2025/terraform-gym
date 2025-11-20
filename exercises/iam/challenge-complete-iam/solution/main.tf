# IAM Challenge: Complete IAM Setup - Solution

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

# Account-level configuration
resource "aws_iam_account_alias" "alias" {
  account_alias = "terraform-gym-${var.student_name}"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 14
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  max_password_age               = 90
  password_reuse_prevention      = 5
  allow_users_to_change_password = true
}

# Groups
resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_group" "operators" {
  name = "operators"
}

resource "aws_iam_group" "admins" {
  name = "admins"
}

# Users
resource "aws_iam_user" "developer" {
  name = "app-developer-${var.student_name}"
}

resource "aws_iam_user" "operator" {
  name = "app-operator-${var.student_name}"
}

resource "aws_iam_user" "admin" {
  name = "app-admin-${var.student_name}"
}

# Group memberships
resource "aws_iam_group_membership" "dev_team" {
  name  = "dev-team"
  group = aws_iam_group.developers.name
  users = [aws_iam_user.developer.name]
}

resource "aws_iam_group_membership" "ops_team" {
  name  = "ops-team"
  group = aws_iam_group.operators.name
  users = [aws_iam_user.operator.name]
}

resource "aws_iam_group_membership" "admin_team" {
  name  = "admin-team"
  group = aws_iam_group.admins.name
  users = [aws_iam_user.admin.name]
}

# Group policy attachments
resource "aws_iam_group_policy_attachment" "dev_readonly" {
  group      = aws_iam_group.developers.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "ops_power" {
  group      = aws_iam_group.operators.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_policy_attachment" "admin_full" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Custom managed policy for S3 access
resource "aws_iam_policy" "s3_app_access" {
  name        = "s3-app-access-${var.student_name}"
  description = "Custom policy for S3 app data access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::app-data-*"
      }
    ]
  })
}

# EC2 role
resource "aws_iam_role" "ec2_app_role" {
  name = "ec2-app-role-${var.student_name}"

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
}

resource "aws_iam_role_policy_attachment" "ec2_s3_access" {
  role       = aws_iam_role.ec2_app_role.name
  policy_arn = aws_iam_policy.s3_app_access.arn
}

# Lambda role
resource "aws_iam_role" "lambda_app_role" {
  name = "lambda-app-role-${var.student_name}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_logs" {
  name = "lambda-logs"
  role = aws_iam_role.lambda_app_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}
