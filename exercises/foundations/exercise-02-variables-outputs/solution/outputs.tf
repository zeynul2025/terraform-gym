# Outputs for Exercise 02

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_region" {
  description = "The region where the bucket is created"
  value       = aws_s3_bucket.example.region
}

output "all_tags" {
  description = "All tags applied to the bucket (marked sensitive for practice)"
  value       = aws_s3_bucket.example.tags_all
  sensitive   = true
}

output "versioning_enabled" {
  description = "Whether versioning is enabled on the bucket"
  value       = var.enable_versioning
}

output "environment" {
  description = "The environment this bucket is deployed in"
  value       = var.environment
}
