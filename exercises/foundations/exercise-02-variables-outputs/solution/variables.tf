# Variables for Exercise 02

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

  validation {
    condition     = length(var.bucket_name) > 3 && length(var.bucket_name) < 63
    error_message = "Bucket name must be between 3 and 63 characters."
  }
}

variable "environment" {
  description = "Environment name (dev, staging, or prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default = {
    ManagedBy   = "Terraform"
    Environment = "Learning"
  }
}

variable "max_objects" {
  description = "Maximum number of objects (example number variable)"
  type        = number
  default     = 1000
}

variable "allowed_ips" {
  description = "List of allowed IP addresses (example list variable)"
  type        = list(string)
  default     = ["10.0.0.0/8", "172.16.0.0/12"]
}
