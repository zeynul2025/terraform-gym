# Outputs for Exercise 03: Security Groups

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "web_security_group_id" {
  description = "ID of the web tier security group"
  value       = aws_security_group.web.id
}

output "app_security_group_id" {
  description = "ID of the app tier security group"
  value       = aws_security_group.app.id
}

output "database_security_group_id" {
  description = "ID of the database tier security group"
  value       = aws_security_group.database.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}
