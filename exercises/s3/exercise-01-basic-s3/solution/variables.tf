# Variables for Exercise 01
# You can use these variables in your main.tf

variable "student_name" {
  description = "Your GitHub username or student ID"
  type        = string
  default     = "REPLACE-WITH-YOUR-NAME"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
