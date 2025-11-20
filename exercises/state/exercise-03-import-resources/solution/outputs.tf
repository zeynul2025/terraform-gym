# Outputs for Exercise 03: Importing Existing Resources

output "legacy_bucket_name" {
  description = "Name of bucket demonstrating legacy import"
  value       = aws_s3_bucket.example_legacy.id
}

output "modern_bucket_name" {
  description = "Name of bucket demonstrating modern import"
  value       = aws_s3_bucket.example_modern.id
}

output "role_name" {
  description = "Name of IAM role for import practice"
  value       = aws_iam_role.example_role.name
}

output "import_commands_reference" {
  description = "Reference for import commands"
  value = <<-EOT
    To practice importing:

    LEGACY METHOD (terraform import):
    1. Create resource manually in AWS
    2. Write Terraform configuration for it
    3. Run: terraform import aws_s3_bucket.bucket_name actual-bucket-name

    MODERN METHOD (import blocks - Terraform 1.5+):
    1. Create resource manually in AWS
    2. Add import block:
       import {
         to = aws_s3_bucket.bucket_name
         id = "actual-bucket-name"
       }
    3. Write resource configuration
    4. Run: terraform plan (shows import will happen)
    5. Run: terraform apply (performs import)

    Verify import worked:
    - terraform state list (should show resource)
    - terraform plan (should show no changes)
  EOT
}
