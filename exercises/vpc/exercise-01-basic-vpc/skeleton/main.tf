# Exercise 01: Basic VPC and Subnets

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

# TODO: Create VPC with CIDR 10.0.0.0/16
# resource "aws_vpc" "main" {
#   cidr_block           = "???"
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#
#   tags = {
#     Name = "???"
#   }
# }

# TODO: Create public subnet 1 (10.0.1.0/24 in us-east-1a)
# TODO: Create public subnet 2 (10.0.2.0/24 in us-east-1b)
# TODO: Create private subnet 1 (10.0.11.0/24 in us-east-1a)
# TODO: Create private subnet 2 (10.0.12.0/24 in us-east-1b)
