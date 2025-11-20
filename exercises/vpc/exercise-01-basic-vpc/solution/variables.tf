# Variables for Exercise 01: Basic VPC

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
