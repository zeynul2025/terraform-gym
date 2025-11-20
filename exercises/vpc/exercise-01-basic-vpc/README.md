# Exercise 01: Basic VPC and Subnets

**Time**: 25 minutes | **Difficulty**: Beginner | **Cost**: $0.00

## Objective

Create a VPC with public and private subnets across two availability zones.

## What You'll Practice

- Creating a VPC with CIDR block
- Creating subnets in different AZs
- Understanding CIDR allocation
- Public vs private subnet design

## Instructions

1. Create a VPC with CIDR 10.0.0.0/16
2. Create 4 subnets:
   - Public subnet 1 (10.0.1.0/24) in us-east-1a
   - Public subnet 2 (10.0.2.0/24) in us-east-1b
   - Private subnet 1 (10.0.11.0/24) in us-east-1a
   - Private subnet 2 (10.0.12.0/24) in us-east-1b

## Success Criteria

- ✅ VPC with 10.0.0.0/16 CIDR
- ✅ 4 subnets across 2 AZs
- ✅ Proper CIDR allocation
- ✅ Tags indicate public/private

## Related Docs

- [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)
- [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
