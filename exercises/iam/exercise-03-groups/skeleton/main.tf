# Exercise 03: IAM Groups

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

# TODO: Create developers group
# TODO: Create admins group
# TODO: Create two users
# TODO: Add users to groups via aws_iam_group_membership
# TODO: Attach ReadOnlyAccess to developers group
# TODO: Attach PowerUserAccess to admins group
