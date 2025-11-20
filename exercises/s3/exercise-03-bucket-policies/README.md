# Exercise 03: S3 Bucket Policies

**Time**: 25 minutes
**Difficulty**: Intermediate
**Cost**: $0.00 (free tier eligible)

## Objective

Create an S3 bucket with a bucket policy that controls access. Learn to work with JSON policies in Terraform using the `jsonencode()` function and understand basic S3 access controls.

## Prerequisites

- Completed Exercise 01 and 02 (or understand S3 basics)
- Basic understanding of AWS IAM policies
- Familiarity with JSON syntax

## What You'll Practice

- Creating S3 bucket policies
- Using `jsonencode()` to embed JSON in HCL
- Referencing resource ARNs in policies
- Understanding policy statements (Effect, Principal, Action, Resource)
- Blocking public access while allowing specific access patterns

## Starting Point

The `skeleton/` directory contains:
- `main.tf` - S3 bucket created, TODOs for policy
- `variables.tf` - Pre-defined variables
- `outputs.tf` - Output definitions

## Instructions

1. **Copy the skeleton to your workspace**
   ```bash
   cp -r skeleton/ my-solution/
   cd my-solution/
   ```

2. **Complete the TODOs in main.tf**
   - Add an `aws_s3_bucket_policy` resource
   - Create a policy that allows read access to a specific IAM user
   - Use `jsonencode()` to define the policy
   - Reference the bucket ARN using resource attributes

3. **Add public access block** (security best practice)
   - Add `aws_s3_bucket_public_access_block` resource
   - Block all public access

4. **Test your configuration**
   ```bash
   terraform init
   terraform fmt
   terraform validate
   terraform plan
   ```

5. **Deploy**
   ```bash
   terraform apply
   ```

6. **Verify the policy**
   ```bash
   # Get your AWS account ID
   export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

   # View the bucket policy
   aws s3api get-bucket-policy --bucket terraform-gym-03-YOUR-NAME | jq .Policy -r | jq
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
- ✅ Create an S3 bucket with all required tags
- ✅ Attach a bucket policy using `aws_s3_bucket_policy`
- ✅ Use `jsonencode()` for the policy document
- ✅ Block public access using `aws_s3_bucket_public_access_block`
- ✅ Allow access to a specific AWS account/principal
- ✅ Include proper policy structure (Version, Statement)
- ✅ Pass all validation checks

## Required Resources

```hcl
# 1. S3 Bucket (provided in skeleton)
resource "aws_s3_bucket" "exercise_bucket" { ... }

# 2. Bucket Policy (you need to add)
resource "aws_s3_bucket_policy" "..." { ... }

# 3. Public Access Block (you need to add)
resource "aws_s3_bucket_public_access_block" "..." { ... }
```

## Expected Cost

- **S3 Bucket**: $0.00 (no storage)
- **Bucket Policy**: $0.00 (no charge for policies)
- **Total**: ~$0.00/month

## Hints

<details>
<summary>Hint 1: Bucket Policy structure</summary>

```hcl
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.exercise_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DescriptiveName"
        Effect    = "Allow"  # or "Deny"
        Principal = {
          AWS = "arn:aws:iam::${var.aws_account_id}:root"
        }
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.exercise_bucket.arn,
          "${aws_s3_bucket.exercise_bucket.arn}/*"
        ]
      }
    ]
  })
}
```
</details>

<details>
<summary>Hint 2: Public Access Block</summary>

```hcl
resource "aws_s3_bucket_public_access_block" "bucket_pab" {
  bucket = aws_s3_bucket.exercise_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
```
</details>

<details>
<summary>Hint 3: Getting AWS Account ID</summary>

You can get your AWS account ID in Terraform using a data source:

```hcl
data "aws_caller_identity" "current" {}

# Then reference it as: data.aws_caller_identity.current.account_id
```

Or use it in a variable:
```bash
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
```
</details>

<details>
<summary>Hint 4: Understanding Policy Resources</summary>

In S3 policies:
- Bucket resource: `aws_s3_bucket.name.arn` (for bucket-level operations like ListBucket)
- Object resource: `${aws_s3_bucket.name.arn}/*` (for object operations like GetObject)

You often need both in the Resource array.
</details>

## Learning Outcomes

After completing this exercise, you should be able to:
- ✅ Create S3 bucket policies using Terraform
- ✅ Use `jsonencode()` to embed JSON in HCL
- ✅ Reference resource attributes in policies
- ✅ Understand IAM policy structure
- ✅ Implement S3 public access blocking
- ✅ Use data sources to get AWS account information
- ✅ Differentiate between bucket and object resources in policies

## Common Mistakes

❌ **Forgetting the `/*` for object-level actions**
- `GetObject` needs `arn:aws:s3:::bucket/*`
- `ListBucket` needs `arn:aws:s3:::bucket`

❌ **Hardcoding AWS account ID**
- Bad: `"arn:aws:iam::123456789012:root"`
- Good: Use a variable or data source

❌ **Using `json` instead of `jsonencode()`**
- Terraform has built-in `jsonencode()` function
- Don't use raw JSON strings

❌ **Policy without Version field**
- Always include `Version = "2012-10-17"`

❌ **Circular dependencies**
- Bucket policy references bucket → OK
- Bucket references policy → Not OK

## Key Concepts

### jsonencode() Function
Converts HCL expressions to JSON:
```hcl
policy = jsonencode({
  key = "value"
  nested = {
    key = "value"
  }
})
```

This is cleaner than raw JSON strings and allows you to use Terraform interpolation.

### IAM Policy Structure
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Optional identifier",
      "Effect": "Allow or Deny",
      "Principal": "Who can access",
      "Action": "What they can do",
      "Resource": "What they can access"
    }
  ]
}
```

### Public Access Block
Four settings to prevent accidental public exposure:
- `block_public_acls`: Block public ACLs
- `block_public_policy`: Block public bucket policies
- `ignore_public_acls`: Ignore existing public ACLs
- `restrict_public_buckets`: Restrict public bucket policies

**Best practice**: Set all to `true` unless you specifically need public access.

## Challenge Extensions

After completing the basic exercise, try these challenges:

**Challenge 1: Condition-based policy**
- Add a condition that restricts access to a specific IP range
- Use the `Condition` block in the policy

**Challenge 2: Multiple statements**
- Create a policy with multiple statements
- Allow read for one principal, write for another

**Challenge 3: Deny policy**
- Create a statement that explicitly denies certain actions
- Understand Allow vs Deny precedence

**Challenge 4: Use data source for account ID**
- Replace the variable with `aws_caller_identity` data source
- Remove the account_id variable entirely

## Verification Commands

```bash
# View the bucket policy
aws s3api get-bucket-policy \
  --bucket terraform-gym-03-YOUR-NAME \
  | jq .Policy -r | jq

# Check public access block
aws s3api get-public-access-block \
  --bucket terraform-gym-03-YOUR-NAME

# Test access (this should work if your account matches the policy)
aws s3 ls s3://terraform-gym-03-YOUR-NAME

# View policy in formatted JSON
terraform show -json | jq '.values.root_module.resources[] | select(.address=="aws_s3_bucket_policy.bucket_policy") | .values.policy' -r | jq
```

## Next Steps

Once you complete this exercise:
- Try **Exercise 04** to add lifecycle rules
- Experiment: Add a second policy statement
- Challenge: Use the `aws_iam_policy_document` data source instead of `jsonencode()`

## Time Breakdown

- Read instructions: 4 min
- Add bucket policy: 8 min
- Add public access block: 3 min
- Test and debug policy: 6 min
- Verify and cleanup: 4 min
- **Total**: ~25 minutes

## Related Course Material

- Course: IAM policies and permissions
- AWS Docs: [S3 Bucket Policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-policies.html)
- Terraform Docs: [aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)

## Real-World Use Cases

This pattern is used for:
- **Shared buckets**: Multiple AWS accounts accessing the same bucket
- **Cross-account access**: Allow another account to read your data
- **Application access**: Grant EC2 instances or Lambda functions access
- **Logging buckets**: Allow services like CloudTrail to write logs
- **Static website hosting**: Controlled public read access
