# Exercise 04: Locals and Functions

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
  region = var.aws_region
}

# Data source for account info
data "aws_caller_identity" "current" {}

# Local values demonstrating various functions
locals {
  # String functions
  bucket_prefix = lower("TerraformGym-04")
  bucket_suffix = join("-", [var.environment, data.aws_caller_identity.current.account_id])
  bucket_name   = format("%s-%s", local.bucket_prefix, local.bucket_suffix)

  # Collection functions - merge maps
  common_tags = {
    ManagedBy   = "Terraform"
    Environment = var.environment
    Exercise    = "04-locals-functions"
  }

  resource_tags = merge(
    local.common_tags,
    var.custom_tags,
    {
      BucketName = local.bucket_name
      CreatedAt  = timestamp()
    }
  )

  # List functions
  availability_zones     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  availability_zone_keys = keys({ for az in local.availability_zones : az => az })

  # Conditional expression
  versioning_status = var.enable_versioning ? "Enabled" : "Disabled"
  bucket_acl        = var.environment == "prod" ? "private" : "private"

  # For expression - create multiple bucket names
  bucket_suffixes = ["data", "logs", "backups"]
  all_bucket_names = [
    for suffix in local.bucket_suffixes :
    "${local.bucket_prefix}-${suffix}-${var.environment}"
  ]

  # String manipulation
  environment_upper = upper(var.environment)
  project_name      = replace(var.project_name, "_", "-")

  # Compute object count
  object_limit = var.max_objects * (var.environment == "prod" ? 10 : 1)

  # Map transformation
  tag_keys = keys(local.common_tags)
  tag_values = values(local.common_tags)
}

# Main S3 bucket using locals
resource "aws_s3_bucket" "main" {
  bucket        = local.bucket_name
  force_destroy = true

  tags = local.resource_tags
}

# Conditionally create versioning
resource "aws_s3_bucket_versioning" "main" {
  count  = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.main.id

  versioning_configuration {
    status = local.versioning_status
  }
}

# Create multiple buckets using for_each
resource "aws_s3_bucket" "environment_buckets" {
  for_each = toset(local.bucket_suffixes)

  bucket        = "${local.bucket_prefix}-${each.value}-${var.environment}"
  force_destroy = true

  tags = merge(
    local.common_tags,
    {
      Name    = "${local.bucket_prefix}-${each.value}-${var.environment}"
      Purpose = title(each.value)
      Type    = each.key
    }
  )
}
