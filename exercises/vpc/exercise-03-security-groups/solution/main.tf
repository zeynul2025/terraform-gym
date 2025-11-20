# Exercise 03: Security Groups - Solution

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "terraform-gym-vpc-sg-${var.student_name}"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
    Type = "Public"
  }
}

# Private Subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet"
    Type = "Private"
  }
}

# Web Tier Security Group (public-facing)
resource "aws_security_group" "web" {
  name        = "web-tier-sg-${var.student_name}"
  description = "Security group for web tier (HTTP/HTTPS)"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "Web Tier Security Group"
    Tier        = "Web"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Web tier ingress rules
resource "aws_vpc_security_group_ingress_rule" "web_http" {
  security_group_id = aws_security_group.web.id
  description       = "Allow HTTP from internet"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_https" {
  security_group_id = aws_security_group.web.id
  description       = "Allow HTTPS from internet"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "web_ssh" {
  security_group_id = aws_security_group.web.id
  description       = "Allow SSH for management"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

# Web tier egress rules
resource "aws_vpc_security_group_egress_rule" "web_all" {
  security_group_id = aws_security_group.web.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

# Application Tier Security Group (private)
resource "aws_security_group" "app" {
  name        = "app-tier-sg-${var.student_name}"
  description = "Security group for application tier"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "App Tier Security Group"
    Tier        = "App"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# App tier ingress rules
resource "aws_vpc_security_group_ingress_rule" "app_from_web" {
  security_group_id            = aws_security_group.app.id
  description                  = "Allow traffic from web tier"
  from_port                    = 8080
  to_port                      = 8080
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.web.id
}

# App tier egress rules
resource "aws_vpc_security_group_egress_rule" "app_all" {
  security_group_id = aws_security_group.app.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

# Database Tier Security Group (private)
resource "aws_security_group" "database" {
  name        = "database-tier-sg-${var.student_name}"
  description = "Security group for database tier"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "Database Tier Security Group"
    Tier        = "Database"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

# Database tier ingress rules
resource "aws_vpc_security_group_ingress_rule" "db_from_app" {
  security_group_id            = aws_security_group.database.id
  description                  = "Allow MySQL from app tier"
  from_port                    = 3306
  to_port                      = 3306
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.app.id
}

resource "aws_vpc_security_group_ingress_rule" "db_postgres_from_app" {
  security_group_id            = aws_security_group.database.id
  description                  = "Allow PostgreSQL from app tier"
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.app.id
}

# Database tier egress rules
resource "aws_vpc_security_group_egress_rule" "db_all" {
  security_group_id = aws_security_group.database.id
  description       = "Allow all outbound traffic"
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
