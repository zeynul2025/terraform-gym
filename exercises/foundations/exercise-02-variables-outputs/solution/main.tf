# Exercise 02: Variables and Outputs

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

resource "aws_s3_bucket" "example" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = merge(
    var.common_tags,
    {
      Name        = "Exercise 02 Bucket"
      Environment = var.environment
      MaxObjects  = tostring(var.max_objects)
    }
  )
}

# Conditionally enable versioning based on variable
resource "aws_s3_bucket_versioning" "example" {
  count  = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}
