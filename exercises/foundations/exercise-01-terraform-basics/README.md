# Exercise 01: Terraform Basics

**Time**: 20 minutes | **Difficulty**: Absolute Beginner | **Cost**: $0.00

## Objective

Learn fundamental HCL syntax, understand basic Terraform blocks, and practice the core Terraform workflow. This is your first Terraform configuration!

## What You'll Practice

- HCL syntax (blocks, arguments, comments)
- Terraform block (version constraints)
- Provider block (AWS configuration)
- Resource block (creating infrastructure)
- The workflow: init → fmt → validate → plan → apply → destroy

## Instructions

1. **Understand the structure** - Read through skeleton
2. **Complete TODOs** - Fill in missing pieces
3. **Initialize** - Run `terraform init`
4. **Format** - Run `terraform fmt`
5. **Validate** - Run `terraform validate`
6. **Plan** - Run `terraform plan`
7. **Apply** - Run `terraform apply`
8. **Verify** - Check AWS Console or CLI
9. **Destroy** - Run `terraform destroy`

## Success Criteria

- ✅ All three blocks present (terraform, provider, resource)
- ✅ Code is properly formatted
- ✅ Configuration is valid
- ✅ S3 bucket created successfully
- ✅ Can destroy cleanly

## Key Concepts

### HCL Syntax Basics
```hcl
# This is a comment

/*
  This is a
  multi-line comment
*/

# Block type "label1" "label2" {
block_type "label" {
  # Arguments
  argument = "value"

  # Nested block
  nested_block {
    nested_arg = 123
  }
}
```

### The Three Essential Blocks

**1. Terraform Block** (settings and requirements)
```hcl
terraform {
  required_version = ">= 1.9.0"  # Minimum Terraform version

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

**2. Provider Block** (configure the cloud platform)
```hcl
provider "aws" {
  region = "us-east-1"  # Where to create resources
}
```

**3. Resource Block** (infrastructure to create)
```hcl
resource "aws_s3_bucket" "example" {
  bucket = "my-unique-bucket-name"

  tags = {
    Name = "My Bucket"
  }
}
```

## The Terraform Workflow

```
1. Write .tf files
        ↓
2. terraform init     (download providers)
        ↓
3. terraform fmt      (format code)
        ↓
4. terraform validate (check syntax)
        ↓
5. terraform plan     (preview changes)
        ↓
6. terraform apply    (create infrastructure)
        ↓
7. terraform destroy  (clean up)
```

## Understanding terraform init

What happens when you run `terraform init`:
1. Reads your `terraform` block
2. Downloads required providers (AWS plugin)
3. Creates `.terraform/` directory
4. Creates `.terraform.lock.hcl` (dependency lock file)
5. Prepares backend (state storage)

## Understanding terraform plan

What the plan shows:
- `+` = Create new resource
- `-` = Destroy resource
- `~` = Modify resource
- `-/+` = Destroy and recreate

Example:
```
Terraform will perform the following actions:

  # aws_s3_bucket.example will be created
  + resource "aws_s3_bucket" "example" {
      + bucket = "my-bucket"
      + id     = (known after apply)
      ...
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

## Common First-Time Errors

### Error 1: Provider not initialized
```
Error: Inconsistent dependency lock file
```
**Fix**: Run `terraform init`

### Error 2: Invalid syntax
```
Error: Argument or block definition required
```
**Fix**: Check for missing `=` or `{}`

### Error 3: Bucket name taken
```
Error: error creating S3 Bucket: BucketAlreadyExists
```
**Fix**: Change bucket name to something unique

## Practice Commands

After completing the exercise, try these:

```bash
# View the state
terraform show

# List resources in state
terraform state list

# Get specific resource details
terraform state show aws_s3_bucket.example

# View outputs (if any defined)
terraform output

# Re-format code
terraform fmt

# Check formatting without modifying
terraform fmt -check
```

## File Organization

Typical Terraform project structure:
```
my-project/
├── main.tf          # Main configuration
├── variables.tf     # Variable declarations (later)
├── outputs.tf       # Output values (later)
├── .gitignore       # Git ignore file
├── .terraform/      # Provider plugins (ignored)
└── terraform.tfstate # State file (DO NOT COMMIT!)
```

## Next Steps

After mastering this exercise:
- Add more resources (try 2 S3 buckets)
- Add tags to your bucket
- Experiment with different bucket names
- Try other AWS resources (IAM users, etc.)

## Related Docs

- [Terraform Configuration Syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS S3 Bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
