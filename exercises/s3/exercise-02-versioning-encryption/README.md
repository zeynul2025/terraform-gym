# Exercise 02: S3 Bucket with Versioning and Encryption

**Time**: 20 minutes
**Difficulty**: Beginner
**Cost**: $0.00 (free tier eligible)

## Objective

Extend a basic S3 bucket by adding versioning and server-side encryption using separate resource blocks. Practice working with resource references and nested configuration blocks.

## Prerequisites

- Completed Exercise 01 (or understand basic S3 bucket creation)
- Understand resource references (e.g., `aws_s3_bucket.name.id`)

## What You'll Practice

- Creating multiple related resources
- Using resource references to create dependencies
- Configuring nested blocks
- Working with AWS S3 security features
- Understanding explicit vs implicit dependencies

## Starting Point

The `skeleton/` directory contains:
- `main.tf` - S3 bucket already created, TODOs for versioning and encryption
- `variables.tf` - Pre-defined variables
- `outputs.tf` - Output definitions to complete

## Instructions

1. **Copy the skeleton to your workspace**
   ```bash
   cp -r skeleton/ my-solution/
   cd my-solution/
   ```

2. **Complete the TODOs in main.tf**
   - Add an `aws_s3_bucket_versioning` resource
   - Add an `aws_s3_bucket_server_side_encryption_configuration` resource
   - Use resource references to link them to the bucket

3. **Complete the TODOs in outputs.tf**
   - Add outputs for bucket name, ARN, and versioning status

4. **Test your configuration**
   ```bash
   terraform init
   terraform fmt
   terraform validate
   terraform plan
   ```

5. **Deploy your resources**
   ```bash
   terraform apply
   ```

6. **Verify the configuration**
   ```bash
   # Check versioning
   aws s3api get-bucket-versioning --bucket terraform-gym-02-YOUR-NAME

   # Check encryption
   aws s3api get-bucket-encryption --bucket terraform-gym-02-YOUR-NAME
   ```

7. **Run the validator**
   ```bash
   cd ..
   ./.validator/validate.sh my-solution
   ```

8. **Clean up**
   ```bash
   cd my-solution
   terraform destroy
   ```

## Success Criteria

Your solution should:
- ✅ Create exactly 3 resources (bucket, versioning, encryption)
- ✅ Enable versioning on the bucket
- ✅ Enable AES256 encryption on the bucket
- ✅ Use resource references (not hardcoded bucket names)
- ✅ Have all required tags on the bucket
- ✅ Include outputs for bucket name, ARN, and versioning status
- ✅ Pass all validation checks

## Required Resources

```hcl
# 1. S3 Bucket (already provided in skeleton)
resource "aws_s3_bucket" "exercise_bucket" { ... }

# 2. Versioning (you need to add)
resource "aws_s3_bucket_versioning" "..." { ... }

# 3. Encryption (you need to add)
resource "aws_s3_bucket_server_side_encryption_configuration" "..." { ... }
```

## Expected Cost

- **Storage**: $0.00 (empty bucket)
- **Versioning**: $0.00 (no version overhead for empty bucket)
- **Encryption**: $0.00 (AES256 is free, uses AWS-managed keys)
- **Total**: ~$0.00/month

## Hints

<details>
<summary>Hint 1: Versioning resource structure</summary>

```hcl
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.exercise_bucket.id  # Reference the bucket!

  versioning_configuration {
    status = "Enabled"
  }
}
```
</details>

<details>
<summary>Hint 2: Encryption resource structure</summary>

```hcl
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.exercise_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
```
</details>

<details>
<summary>Hint 3: Resource references</summary>

When referencing another resource:
- Format: `RESOURCE_TYPE.LOCAL_NAME.ATTRIBUTE`
- Example: `aws_s3_bucket.exercise_bucket.id`
- Common attributes: `id`, `arn`, `name`
- This creates an implicit dependency (Terraform creates bucket first)
</details>

<details>
<summary>Hint 4: Output examples</summary>

```hcl
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.exercise_bucket.arn
}
```
</details>

## Learning Outcomes

After completing this exercise, you should be able to:
- ✅ Create multiple related AWS resources
- ✅ Use resource references to establish dependencies
- ✅ Work with nested configuration blocks
- ✅ Enable S3 bucket versioning
- ✅ Configure S3 server-side encryption
- ✅ Define useful outputs
- ✅ Verify AWS resource configuration via CLI

## Common Mistakes

❌ **Hardcoding bucket name in versioning/encryption resources**
- Bad: `bucket = "terraform-gym-02-john"`
- Good: `bucket = aws_s3_bucket.exercise_bucket.id`
- Why: References create dependencies and make code reusable

❌ **Wrong nesting in encryption block**
- The encryption config requires `rule { apply_server_side_encryption_by_default { ... } }`
- Missing either level will cause validation errors

❌ **Using `bucket` instead of `id` attribute**
- While `bucket` might work, `id` is the standard attribute for S3 buckets

❌ **Missing `versioning_configuration` block**
- Can't just set `status = "Enabled"` directly
- Must be inside `versioning_configuration { ... }`

## Challenge Extensions

After completing the basic exercise, try these challenges:

**Challenge 1: Add bucket lifecycle rules**
- Create an `aws_s3_bucket_lifecycle_configuration` resource
- Delete old versions after 30 days
- Hint: Look up `noncurrent_version_expiration`

**Challenge 2: Add intelligent tiering**
- Research `aws_s3_bucket_intelligent_tiering_configuration`
- Configure automatic cost optimization

**Challenge 3: Add more outputs**
- Output the versioning status
- Output the encryption algorithm
- Make outputs more informative with descriptions

## Verification Commands

```bash
# Check what resources will be created
terraform plan

# See the dependency graph
terraform graph | dot -Tpng > graph.png

# After apply, view all outputs
terraform output

# Check bucket versioning status
aws s3api get-bucket-versioning --bucket $(terraform output -raw bucket_name)

# Check encryption configuration
aws s3api get-bucket-encryption --bucket $(terraform output -raw bucket_name)

# List all resources in state
terraform state list
```

## Next Steps

Once you complete this exercise:
- Try **Exercise 03** to configure remote state backend
- Experiment: Add public access blocking to the bucket
- Challenge: Create a second bucket with different encryption (KMS)

## Time Breakdown

- Read instructions: 3 min
- Add versioning resource: 4 min
- Add encryption resource: 5 min
- Add outputs: 3 min
- Test and validate: 3 min
- Deploy and verify: 2 min
- **Total**: ~20 minutes

## Related Course Material

- Course Lab 0, Section 5.6: "Add Versioning"
- Course Lab 0, Section 5.7: "Add Encryption"
- Course Lab 0, Section 5.8: "Add Outputs"

## Key Concepts

**Resource References**
- Terraform automatically determines creation order based on references
- `aws_s3_bucket.name.id` creates an implicit dependency
- Terraform will create the bucket before versioning/encryption

**Nested Blocks**
- Some resources require multi-level nesting
- Each level groups related configuration
- Indentation matters for readability (use `terraform fmt`)

**AWS S3 Versioning**
- Keeps multiple versions of an object
- Protects against accidental deletion
- Slightly increases storage cost (only if you store multiple versions)

**AWS S3 Encryption**
- AES256: AWS-managed keys (free)
- aws:kms: Customer-managed keys (small cost)
- Encryption is at rest (protects stored data)
