# Outputs for Exercise 02: IAM Roles and Policies

output "role_name" {
  description = "Name of the IAM role"
  value       = aws_iam_role.ec2_role.name
}

output "role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.ec2_role.arn
}

output "policy_name" {
  description = "Name of the inline policy"
  value       = aws_iam_role_policy.s3_read_policy.name
}
