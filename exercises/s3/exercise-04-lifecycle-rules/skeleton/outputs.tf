# Outputs for Exercise 04

output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.arn
}

output "versioning_status" {
  description = "Versioning status"
  value       = aws_s3_bucket_versioning.bucket_versioning.versioning_configuration[0].status
}
