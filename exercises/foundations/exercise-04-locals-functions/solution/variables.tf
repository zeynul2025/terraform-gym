# Variables for Exercise 04

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (dev, staging, or prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "project_name" {
  description = "Project name (underscores will be replaced with hyphens)"
  type        = string
  default     = "terraform_gym"
}

variable "enable_versioning" {
  description = "Enable versioning on buckets"
  type        = bool
  default     = false
}

variable "max_objects" {
  description = "Maximum number of objects per bucket"
  type        = number
  default     = 1000
}

variable "custom_tags" {
  description = "Custom tags to merge with common tags"
  type        = map(string)
  default     = {}
}
