# Exercise 02: IAM Roles and Policies

**Time**: 25 minutes | **Difficulty**: Intermediate | **Cost**: $0.00

## Objective

Create IAM roles with custom inline policies and trust relationships. Learn how to allow AWS services to assume roles.

## What You'll Practice

- Creating IAM roles
- Defining assume role policies (trust relationships)
- Writing custom inline policy documents
- Service principals (ec2.amazonaws.com, lambda.amazonaws.com)
- Using `jsonencode()` for complex policies

## Instructions

1. Create an IAM role that EC2 instances can assume
2. Define a custom policy that allows S3 read access
3. Attach the policy to the role
4. Output the role ARN

## Success Criteria

- ✅ IAM role created for EC2 service
- ✅ Assume role policy allows ec2.amazonaws.com
- ✅ Custom inline policy allows s3:GetObject and s3:ListBucket
- ✅ Policy attached to role

## Key Concepts

**IAM Role**: An identity with specific permissions that can be assumed by:
- AWS services (EC2, Lambda, etc.)
- Users from other accounts
- Federated users

**Trust Policy (Assume Role Policy)**: Defines WHO can assume the role
**Permission Policy**: Defines WHAT the role can do

## Related Docs

- [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
- [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy)
