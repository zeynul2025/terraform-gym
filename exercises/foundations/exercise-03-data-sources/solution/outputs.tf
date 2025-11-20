# Outputs for Exercise 03

# Outputs from data sources
output "account_id" {
  description = "AWS Account ID from data source"
  value       = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  description = "ARN of the calling identity"
  value       = data.aws_caller_identity.current.arn
}

output "caller_user" {
  description = "User ID of the calling identity"
  value       = data.aws_caller_identity.current.user_id
}

output "current_region" {
  description = "Current AWS region from data source"
  value       = data.aws_region.current.name
}

output "region_description" {
  description = "Description of the current region"
  value       = data.aws_region.current.description
}

output "availability_zones" {
  description = "List of available availability zones"
  value       = data.aws_availability_zones.available.names
}

output "availability_zone_count" {
  description = "Number of availability zones in the region"
  value       = length(data.aws_availability_zones.available.names)
}

# Bucket outputs
output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_region" {
  description = "Region where bucket was created"
  value       = aws_s3_bucket.example.region
}
