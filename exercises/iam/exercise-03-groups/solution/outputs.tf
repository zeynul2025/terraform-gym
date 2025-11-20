# Outputs for Exercise 03: IAM Groups

output "developers_group_name" {
  description = "Name of the developers group"
  value       = aws_iam_group.developers.name
}

output "developers_group_arn" {
  description = "ARN of the developers group"
  value       = aws_iam_group.developers.arn
}

output "admins_group_name" {
  description = "Name of the admins group"
  value       = aws_iam_group.admins.name
}

output "admins_group_arn" {
  description = "ARN of the admins group"
  value       = aws_iam_group.admins.arn
}

output "dev_user_name" {
  description = "Name of the developer user"
  value       = aws_iam_user.dev_user.name
}

output "admin_user_name" {
  description = "Name of the admin user"
  value       = aws_iam_user.admin_user.name
}
