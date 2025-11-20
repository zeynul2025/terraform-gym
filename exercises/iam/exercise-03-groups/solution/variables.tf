# Variables for Exercise 03: IAM Groups

variable "region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "student_name" {
  description = "Student name for resource naming"
  type        = string
  default     = "student"
}
