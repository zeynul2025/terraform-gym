# Outputs for Exercise 03

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.arn
}

output "aws_account_id" {
  description = "AWS Account ID (from data source)"
  value       = data.aws_caller_identity.current.account_id
}
