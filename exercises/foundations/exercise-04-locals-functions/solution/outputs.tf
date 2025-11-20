# Outputs for Exercise 04

# Demonstrating local values
output "computed_bucket_name" {
  description = "Bucket name computed using locals and functions"
  value       = local.bucket_name
}

output "all_bucket_names" {
  description = "List of all bucket names generated using for expression"
  value       = local.all_bucket_names
}

output "versioning_status" {
  description = "Versioning status determined by conditional expression"
  value       = local.versioning_status
}

output "object_limit" {
  description = "Object limit computed based on environment"
  value       = local.object_limit
}

# Main bucket outputs
output "main_bucket_id" {
  description = "ID of the main S3 bucket"
  value       = aws_s3_bucket.main.id
}

output "main_bucket_arn" {
  description = "ARN of the main S3 bucket"
  value       = aws_s3_bucket.main.arn
}

# Environment buckets outputs
output "environment_bucket_ids" {
  description = "Map of environment bucket IDs"
  value       = { for k, v in aws_s3_bucket.environment_buckets : k => v.id }
}

output "environment_bucket_arns" {
  description = "Map of environment bucket ARNs"
  value       = { for k, v in aws_s3_bucket.environment_buckets : k => v.arn }
}

# Demonstrating functions on outputs
output "merged_tags" {
  description = "Merged common and custom tags"
  value       = local.resource_tags
  sensitive   = true # Hide timestamp in output
}

output "tag_keys" {
  description = "List of tag keys from common_tags"
  value       = local.tag_keys
}

output "environment_upper" {
  description = "Environment name in uppercase"
  value       = local.environment_upper
}

output "project_name_formatted" {
  description = "Project name with underscores replaced by hyphens"
  value       = local.project_name
}
