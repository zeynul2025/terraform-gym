# IAM Challenge: Complete IAM Setup

**Time**: 60 minutes | **Difficulty**: Challenge | **Cost**: $0.00

## 🎯 Challenge Overview

Build a complete IAM infrastructure for a multi-tier application **from scratch** using only Terraform documentation. NO skeleton code or TODOs provided!

## 📋 Requirements

Create a Terraform configuration with:

### 1. IAM Users (3 users)
- `app-developer-{your-name}`
- `app-operator-{your-name}`
- `app-admin-{your-name}`

### 2. IAM Groups (3 groups)
- `developers` - ReadOnlyAccess
- `operators` - PowerUserAccess
- `admins` - AdministratorAccess

### 3. Group Memberships
- Add each user to their respective group

### 4. IAM Roles (2 roles)
- **EC2 role**: For application servers
  - Trust: ec2.amazonaws.com
  - Permissions: S3 read access to specific bucket
- **Lambda role**: For serverless functions
  - Trust: lambda.amazonaws.com
  - Permissions: CloudWatch Logs write access

### 5. Custom Policy (NEW!)
Create a custom managed policy for S3 access:
- Allow: s3:GetObject, s3:PutObject, s3:ListBucket
- Resource: arn:aws:s3:::app-data-*
- Attach to EC2 role

### 6. Password Policy (NEW!)
Configure account password policy:
- Minimum length: 14 characters
- Require uppercase, lowercase, numbers, symbols
- Max age: 90 days
- Password reuse prevention: 5

### 7. Account Alias (NEW!)
Set account alias: `terraform-gym-{your-name}`

## 📚 Documentation Resources

### Core Resources (from exercises)
- [aws_iam_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)
- [aws_iam_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)
- [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)
- [aws_iam_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy)

### New Resources (research required!)
- [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)
- [aws_iam_account_password_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy)
- [aws_iam_account_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_alias)

## ✅ Success Criteria

- ✅ 3 IAM users created
- ✅ 3 IAM groups with policy attachments
- ✅ Users assigned to groups
- ✅ 2 IAM roles with trust policies
- ✅ Custom managed policy created and attached
- ✅ Password policy configured
- ✅ Account alias set
- ✅ Pass validator with 90+ score

## 🚫 Rules

- No skeleton code - start from blank files
- No TODOs - figure it out from docs
- Try for 45+ minutes before checking solution
- All features required

## 💡 Hints

<details>
<summary>Hint: Password Policy gotcha</summary>

The password policy resource is a singleton - only ONE can exist per account:
```hcl
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 14
  require_uppercase_characters   = true
  require_lowercase_characters   = true
  require_numbers                = true
  require_symbols                = true
  max_password_age               = 90
  password_reuse_prevention      = 5
}
```
</details>

<details>
<summary>Hint: Custom managed policy</summary>

Use `aws_iam_policy` to create reusable policies:
```hcl
resource "aws_iam_policy" "s3_app_access" {
  name = "s3-app-access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [...]
  })
}

# Then attach with aws_iam_role_policy_attachment
```
</details>

## Expected Resources

Total: ~15 resources
- 3 users
- 3 groups
- 3 group memberships
- 3 group policy attachments
- 2 roles
- 1 custom policy
- 1 password policy
- 1 account alias

## ⚠️ Security Reminder

After completing the challenge:
- Delete all IAM users immediately
- Remove access keys
- Reset password policy if needed
- This is a LEARNING exercise only!

---

**Good luck!** Remember: Research skills are the real test here. 🔍
