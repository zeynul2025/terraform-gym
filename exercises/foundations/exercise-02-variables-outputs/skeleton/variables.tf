# Variables for Exercise 02

# TODO: Add variable for AWS region
# variable "aws_region" {
#   description = "???"
#   type        = ???
#   default     = "us-east-1"
# }

# TODO: Add variable for bucket name with validation
# Validation: length must be > 3 and < 63
# variable "bucket_name" {
#   description = "???"
#   type        = ???
#
#   validation {
#     condition     = length(var.bucket_name) > 3 && length(var.bucket_name) < 63
#     error_message = "Bucket name must be between 3 and 63 characters."
#   }
# }

# TODO: Add variable for environment (string)
# Validation: must be dev, staging, or prod

# TODO: Add variable for enable_versioning (bool)

# TODO: Add variable for common_tags (map of strings)
# variable "common_tags" {
#   description = "Common tags for all resources"
#   type        = map(string)
#   default = {
#     ManagedBy   = "Terraform"
#     Environment = "Learning"
#   }
# }
