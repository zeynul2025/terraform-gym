# Outputs for S3 Challenge

output "bucket_name" {
  description = "Name of the main S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.id
}

output "bucket_arn" {
  description = "ARN of the main S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.arn
}

output "log_bucket_name" {
  description = "Name of the logging bucket"
  value       = aws_s3_bucket.log_bucket.id
}

output "versioning_status" {
  description = "Versioning status of the main bucket"
  value       = aws_s3_bucket_versioning.bucket_versioning.versioning_configuration[0].status
}

output "aws_account_id" {
  description = "AWS Account ID (from data source)"
  value       = data.aws_caller_identity.current.account_id
}

output "object_lock_enabled" {
  description = "Whether object lock is enabled"
  value       = aws_s3_bucket.exercise_bucket.object_lock_enabled
}
