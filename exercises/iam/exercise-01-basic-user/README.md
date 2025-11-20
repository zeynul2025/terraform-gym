# Exercise 01: Basic IAM User

**Time**: 20 minutes | **Difficulty**: Beginner | **Cost**: $0.00

## Objective

Create an IAM user with programmatic access and attach an AWS managed policy. Learn to handle sensitive outputs and understand IAM access key security.

## Prerequisites

- Completed S3 Exercise 01 (or understand basic Terraform)
- Understanding of AWS IAM concepts
- Awareness of access key security risks

## What You'll Practice

- Creating IAM users
- Generating access keys for programmatic access
- Attaching AWS managed policies
- Using sensitive outputs
- Handling credentials securely

## Instructions

1. Copy skeleton to workspace
2. Complete TODOs to create:
   - IAM user resource
   - Access key for the user
   - Policy attachment (ReadOnlyAccess)
3. Deploy and capture credentials securely
4. Test access (optional)
5. Destroy resources

## Success Criteria

- ✅ IAM user created with correct name
- ✅ Access key generated
- ✅ ReadOnlyAccess policy attached
- ✅ Outputs marked as sensitive
- ✅ All required tags present

## Expected Cost

**$0.00** - IAM resources are completely free

## Key Concepts

**Access Keys**:
- Used for programmatic access (AWS CLI, SDKs)
- Consist of Access Key ID + Secret Access Key
- Secret key shown ONLY ONCE at creation
- Should be rotated regularly

**AWS Managed Policies**:
- Pre-built policies maintained by AWS
- Named like `ReadOnlyAccess`, `PowerUserAccess`
- Referenced by ARN: `arn:aws:iam::aws:policy/PolicyName`

**Sensitive Outputs**:
- Mark outputs as `sensitive = true`
- Hides values in console output
- Still accessible via `terraform output`

## ⚠️ CRITICAL SECURITY WARNING ⚠️

**Creating IAM access keys is a security anti-pattern and should be avoided in production!**

This exercise demonstrates access key creation **for learning purposes only**. In real-world scenarios:

❌ **DO NOT**:
- Create access keys for production workloads
- Hardcode or commit access keys to version control
- Share access keys via email, chat, or documentation
- Use access keys when IAM roles are available
- Keep access keys longer than necessary

✅ **DO INSTEAD**:
- Use IAM roles for EC2, Lambda, ECS, and other AWS services
- Use temporary credentials via AWS STS (Security Token Service)
- Enable MFS (Multi-Factor Authentication) for human users
- Rotate credentials regularly if you must use access keys
- Use AWS Secrets Manager or Parameter Store for credential storage

**For this exercise**:
- The access keys will be visible in Terraform state
- Run `terraform destroy` IMMEDIATELY after completing the exercise
- Never use these credentials for anything beyond this exercise

## Related Docs

- [aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)
- [aws_iam_access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key)
- [aws_iam_user_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment)
