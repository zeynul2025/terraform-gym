# Outputs for Exercise 02: State Commands

output "alpha_bucket" {
  description = "Alpha bucket name"
  value       = aws_s3_bucket.bucket_alpha.id
}

output "beta_bucket" {
  description = "Beta bucket name"
  value       = aws_s3_bucket.bucket_beta.id
}

output "gamma_bucket" {
  description = "Gamma bucket name"
  value       = aws_s3_bucket.bucket_gamma.id
}

output "test_user" {
  description = "Test IAM user name"
  value       = aws_iam_user.test_user.name
}

output "state_commands_reference" {
  description = "Reference for state commands to practice"
  value = <<-EOT
    Practice these commands after deploying:

    1. List all resources:
       terraform state list

    2. Show specific resource:
       terraform state show aws_s3_bucket.bucket_alpha

    3. Move/rename resource:
       terraform state mv aws_s3_bucket.bucket_alpha aws_s3_bucket.bucket_renamed
       (Then update main.tf to match the new name)

    4. Remove resource from state (keeps in AWS):
       terraform state rm aws_s3_bucket.bucket_beta

    5. Pull state to local file:
       terraform state pull > backup.tfstate
  EOT
}
