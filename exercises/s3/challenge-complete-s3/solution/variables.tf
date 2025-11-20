# Variables for S3 Challenge

variable "student_name" {
  description = "Your GitHub username or student ID (must be lowercase, no spaces)"
  type        = string
  default     = "REPLACE-WITH-YOUR-NAME"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.student_name))
    error_message = "Student name must be lowercase alphanumeric with hyphens only (for S3 bucket naming)."
  }
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
