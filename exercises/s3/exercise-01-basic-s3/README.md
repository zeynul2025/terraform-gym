# Exercise 01: Basic S3 Bucket

**Time**: 15 minutes
**Difficulty**: Beginner
**Cost**: $0.00 (free tier eligible)

## Objective

Create a simple S3 bucket with proper configuration blocks and required tags. This exercise reinforces the basic structure of a Terraform configuration.

## Prerequisites

- Completed Course Lab 0 (or familiar with basic Terraform syntax)
- AWS CLI configured
- Terraform 1.9.0+ installed

## What You'll Practice

- Writing `terraform` and `provider` blocks
- Creating an AWS S3 bucket resource
- Adding tags to resources
- Using proper naming conventions
- Running the Terraform workflow

## Starting Point

The `skeleton/` directory contains:
- `main.tf` - Partial configuration with TODOs
- `variables.tf` - Pre-defined variables for you to use

## Instructions

1. **Copy the skeleton to your workspace**
   ```bash
   cp -r skeleton/ my-solution/
   cd my-solution/
   ```

2. **Complete the TODOs in main.tf**
   - Add the Terraform version constraint block
   - Configure the AWS provider
   - Create an S3 bucket resource with a unique name
   - Add all required tags

3. **Test your configuration**
   ```bash
   terraform init
   terraform fmt
   terraform validate
   terraform plan
   ```

4. **Deploy your bucket**
   ```bash
   terraform apply
   ```

5. **Verify in AWS**
   ```bash
   aws s3 ls | grep terraform-gym-01
   ```

6. **Run the validator**
   ```bash
   cd ..
   ./.validator/validate.sh my-solution
   ```

7. **Clean up**
   ```bash
   cd my-solution
   terraform destroy
   ```

## Success Criteria

Your solution should:
- ✅ Pass `terraform fmt -check`
- ✅ Pass `terraform validate`
- ✅ Create exactly 1 S3 bucket
- ✅ Use Terraform 1.9.0 or later
- ✅ Use AWS provider version ~> 5.0
- ✅ Include all 5 required tags (Name, Environment, ManagedBy, Student, AutoTeardown)
- ✅ Have a globally unique bucket name

## Required Tags

All resources must include these tags:
```hcl
tags = {
  Name         = "Exercise 01 S3 Bucket"
  Environment  = "Learning"
  ManagedBy    = "Terraform"
  Student      = var.student_name  # From variables.tf
  AutoTeardown = "1h"
}
```

## Expected Cost

- **Storage**: $0.00 (empty bucket)
- **Requests**: $0.00 (no operations)
- **Total**: ~$0.00/month

## Hints

<details>
<summary>Hint 1: Terraform block structure</summary>

```hcl
terraform {
  required_version = ">= X.Y.Z"

  required_providers {
    PROVIDER = {
      source  = "..."
      version = "..."
    }
  }
}
```
</details>

<details>
<summary>Hint 2: S3 bucket naming</summary>

S3 bucket names must be:
- Globally unique across ALL AWS accounts
- 3-63 characters long
- Lowercase letters, numbers, and hyphens only
- No underscores or spaces

Example: `terraform-gym-01-yourname`
</details>

<details>
<summary>Hint 3: Complete resource block</summary>

```hcl
resource "aws_s3_bucket" "exercise_bucket" {
  bucket = "terraform-gym-01-${var.student_name}"

  tags = {
    # Add all 5 required tags here
  }
}
```
</details>

## Learning Outcomes

After completing this exercise, you should be able to:
- ✅ Write a complete Terraform configuration from scratch
- ✅ Understand the purpose of terraform, provider, and resource blocks
- ✅ Use variables in resource names
- ✅ Apply consistent tagging to AWS resources
- ✅ Execute the basic Terraform workflow (init, plan, apply, destroy)

## Common Mistakes

❌ **Forgetting the terraform block**
- Every configuration needs version requirements

❌ **Missing required_providers**
- Terraform won't know where to download the AWS plugin

❌ **Bucket name not globally unique**
- Use your name/ID in the bucket name
- Test: `aws s3 ls | grep YOUR-BUCKET-NAME` should be empty before creating

❌ **Forgetting tags**
- All resources need the 5 required tags

❌ **Not cleaning up**
- Always run `terraform destroy` after completing exercises

## Next Steps

Once you complete this exercise:
- Try **Exercise 02** to add versioning and encryption
- Experiment: Can you add a second bucket?
- Challenge: Use a `local` block to define common tags

## Time Breakdown

- Read instructions: 3 min
- Complete TODOs: 5 min
- Test and validate: 4 min
- Deploy and verify: 2 min
- Cleanup: 1 min
- **Total**: ~15 minutes

## Related Course Material

- Course Lab 0, Part 5: "Deploy Test Infrastructure"
- Course Lab 0, Section 5.2-5.4: "Basic S3 Bucket Creation"
