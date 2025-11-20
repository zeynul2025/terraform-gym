# Exercise 03: Importing Existing Resources

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

# TODO: Step 1 - Create bucket manually:
# aws s3 mb s3://terraform-gym-import-legacy-YOURNAME

# TODO: Step 2 - Write config for that bucket
# resource "aws_s3_bucket" "imported_legacy" {
#   bucket = "terraform-gym-import-legacy-YOURNAME"
#   tags = {
#     Name = "Imported via Legacy Method"
#   }
# }

# TODO: Step 3 - Import it:
# terraform import aws_s3_bucket.imported_legacy terraform-gym-import-legacy-YOURNAME

# TODO: Step 4 - Create another bucket manually:
# aws s3 mb s3://terraform-gym-import-modern-YOURNAME

# TODO: Step 5 - Use import block (Terraform 1.5+):
# import {
#   to = aws_s3_bucket.imported_modern
#   id = "terraform-gym-import-modern-YOURNAME"
# }

# resource "aws_s3_bucket" "imported_modern" {
#   bucket = "terraform-gym-import-modern-YOURNAME"
#   tags = {
#     Name = "Imported via Modern Import Block"
#   }
# }

# TODO: Step 6 - Run terraform plan (shows import)
# TODO: Step 7 - Run terraform apply (performs import)
# TODO: Step 8 - Verify: terraform plan (should show no changes)
