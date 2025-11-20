# Exercise 03: Importing Existing Resources

**Time**: 25 minutes | **Difficulty**: Intermediate | **Cost**: $0.00

## Objective

Import existing AWS resources into Terraform management. Learn both legacy `terraform import` and modern import blocks.

## What You'll Practice

- Creating AWS resources manually (AWS CLI)
- Writing Terraform configuration for existing resources
- Using `terraform import` command (legacy)
- Using `import` blocks (Terraform 1.5+, preferred)
- Verifying imported resources

## Instructions

1. Create S3 bucket manually via AWS CLI
2. Write Terraform configuration matching the bucket
3. Import using legacy command method
4. Create another bucket manually
5. Import using modern import block
6. Verify with `terraform plan` (should show no changes)

## Success Criteria

- ✅ Manually created buckets exist in AWS
- ✅ Written matching Terraform config
- ✅ Imported using both methods
- ✅ `terraform plan` shows no changes
- ✅ Can destroy imported resources

## Key Concepts

**Legacy Import (Terraform < 1.5)**:
```bash
# 1. Write configuration
resource "aws_s3_bucket" "existing" {
  bucket = "my-existing-bucket"
}

# 2. Import
terraform import aws_s3_bucket.existing my-existing-bucket
```

**Modern Import Blocks (Terraform 1.5+)**:
```hcl
import {
  to = aws_s3_bucket.existing
  id = "my-existing-bucket"
}

resource "aws_s3_bucket" "existing" {
  bucket = "my-existing-bucket"
}
```

Then: `terraform plan` (shows import) → `terraform apply` (imports)

## When to Import

- **Brownfield**: Existing infrastructure needs management
- **Migration**: Moving to Terraform from other tools
- **Recovery**: Resource created manually by mistake
- **Adoption**: Taking over infrastructure from another team

## Common Challenges

**Challenge 1: Finding Resource ID**
- Different resources use different IDs
- S3: bucket name
- EC2: instance ID (i-xxx)
- VPC: vpc-xxx
- Check docs for each resource type!

**Challenge 2: Matching Configuration**
- Must match ALL required arguments
- Optional arguments can differ
- Tags might not match (fixable with apply)

**Challenge 3: Nested Resources**
- Some AWS resources split in Terraform
- Example: S3 bucket + bucket versioning
- Import each separately

## Related Docs

- [Import Command](https://developer.hashicorp.com/terraform/cli/commands/import)
- [Import Blocks](https://developer.hashicorp.com/terraform/language/import)
- [AWS Provider Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
