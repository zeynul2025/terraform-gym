# Outputs for Exercise 01: Remote State Backend

output "state_bucket_name" {
  description = "Name of the S3 bucket for state storage"
  value       = aws_s3_bucket.state_bucket.id
}

output "state_bucket_arn" {
  description = "ARN of the state bucket"
  value       = aws_s3_bucket.state_bucket.arn
}

output "backend_config" {
  description = "Backend configuration to use (copy to terraform block)"
  value = <<-EOT
    backend "s3" {
      bucket         = "${aws_s3_bucket.state_bucket.id}"
      key            = "gym/state/exercise-01/terraform.tfstate"
      region         = "${var.region}"
      encrypt        = true
      use_lockfile   = true
    }
  EOT
}

output "test_bucket_name" {
  description = "Name of the test bucket"
  value       = aws_s3_bucket.test_resource.id
}
