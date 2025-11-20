# Outputs for Exercise 04: State Locking

output "bucket_one_name" {
  description = "First test bucket name"
  value       = aws_s3_bucket.bucket_one.id
}

output "bucket_two_name" {
  description = "Second test bucket name"
  value       = aws_s3_bucket.bucket_two.id
}

output "test_user_name" {
  description = "Test user name"
  value       = aws_iam_user.test_user.name
}

output "locking_reference" {
  description = "Reference for state locking troubleshooting"
  value = <<-EOT
    State Locking Concepts:

    1. Check lock status:
       - Locks are stored with state (S3 uses lockfile)
       - Check .terraform.lock.hcl locally

    2. Force unlock (use cautiously!):
       terraform force-unlock LOCK_ID

    3. Prevent lock issues:
       - Always use remote backend with locking
       - Don't run terraform concurrently
       - Use workspaces or separate states for isolation
       - Set shorter lock timeouts if needed

    4. Terraform 1.9+ S3 Native Locking:
       - No DynamoDB table needed!
       - Use use_lockfile = true in backend config
       - Simpler setup, lower cost

    5. If stuck with lock:
       - Verify no one else is running terraform
       - Check if process crashed (orphaned lock)
       - Use force-unlock only if certain it's safe
       - Consider lock_timeout in backend config

    Common lock errors:
    - "Error locking state" - Someone else has lock
    - "Error acquiring the state lock" - Lock file exists
    - Solution: Wait for other operation to finish or force-unlock
  EOT
}
