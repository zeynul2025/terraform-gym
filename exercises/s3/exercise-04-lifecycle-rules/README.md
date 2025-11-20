# Exercise 04: S3 Lifecycle Rules

**Time**: 25 minutes
**Difficulty**: Intermediate
**Cost**: $0.00 (free tier eligible)

## Objective

Configure S3 lifecycle rules to automatically transition objects between storage classes and expire old versions. Learn cost optimization strategies for S3 and practice working with lifecycle configuration resources.

## Prerequisites

- Completed Exercise 02 (versioning) or understand S3 versioning
- Understanding of S3 storage classes
- Basic knowledge of cost optimization

## What You'll Practice

- Creating S3 lifecycle configuration resources
- Transitioning objects between storage classes
- Expiring old object versions
- Using filters to apply rules selectively
- Implementing cost optimization patterns

## Starting Point

The `skeleton/` directory contains:
- `main.tf` - S3 bucket with versioning, TODOs for lifecycle rules
- `variables.tf` - Pre-defined variables
- `outputs.tf` - Output definitions

## Instructions

1. **Copy the skeleton to your workspace**
   ```bash
   cp -r skeleton/ my-solution/
   cd my-solution/
   ```

2. **Complete the TODOs in main.tf**
   - Add `aws_s3_bucket_lifecycle_configuration` resource
   - Create a rule to transition objects to IA storage after 30 days
   - Create a rule to expire noncurrent versions after 90 days
   - Use proper rule structure with id, status, and transitions

3. **Test your configuration**
   ```bash
   terraform init
   terraform fmt
   terraform validate
   terraform plan
   ```

4. **Deploy**
   ```bash
   terraform apply
   ```

5. **Verify lifecycle rules**
   ```bash
   aws s3api get-bucket-lifecycle-configuration \
     --bucket terraform-gym-04-YOUR-NAME | jq
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
- ✅ Create an S3 bucket with versioning enabled
- ✅ Configure lifecycle rules using `aws_s3_bucket_lifecycle_configuration`
- ✅ Transition current objects to STANDARD_IA after 30 days
- ✅ Expire noncurrent versions after 90 days
- ✅ Use proper rule IDs and status
- ✅ Include all required tags
- ✅ Pass all validation checks

## Required Resources

```hcl
# 1. S3 Bucket (provided in skeleton)
resource "aws_s3_bucket" "exercise_bucket" { ... }

# 2. Versioning (provided in skeleton)
resource "aws_s3_bucket_versioning" "bucket_versioning" { ... }

# 3. Lifecycle Configuration (you need to add)
resource "aws_s3_bucket_lifecycle_configuration" "..." { ... }
```

## S3 Storage Classes (Cost Hierarchy)

From most to least expensive:
1. **STANDARD** - Frequent access, $0.023/GB
2. **STANDARD_IA** - Infrequent access, $0.0125/GB (30-day minimum)
3. **INTELLIGENT_TIERING** - Auto-optimization, $0.0025/GB + monitoring
4. **GLACIER_IR** - Instant retrieval archive, $0.004/GB
5. **GLACIER_FLEXIBLE** - Archive, $0.0036/GB
6. **DEEP_ARCHIVE** - Long-term archive, $0.00099/GB

## Expected Cost

- **S3 Bucket**: $0.00 (no storage)
- **Lifecycle Rules**: $0.00 (no charge for rules)
- **Storage Class Transitions**: $0.00 (charged per 1,000 requests when triggered)
- **Total**: ~$0.00/month

## Hints

<details>
<summary>Hint 1: Basic lifecycle configuration structure</summary>

```hcl
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.exercise_bucket.id

  rule {
    id     = "rule-name"
    status = "Enabled"

    # Rule configuration here...
  }
}
```
</details>

<details>
<summary>Hint 2: Transition to Infrequent Access</summary>

```hcl
rule {
  id     = "transition-to-ia"
  status = "Enabled"

  transition {
    days          = 30
    storage_class = "STANDARD_IA"
  }
}
```
</details>

<details>
<summary>Hint 3: Expire noncurrent versions</summary>

```hcl
rule {
  id     = "expire-old-versions"
  status = "Enabled"

  noncurrent_version_expiration {
    noncurrent_days = 90
  }
}
```
</details>

<details>
<summary>Hint 4: Complete example with both rules</summary>

```hcl
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.exercise_bucket.id

  rule {
    id     = "transition-to-ia"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 90
    }
  }
}
```
</details>

## Learning Outcomes

After completing this exercise, you should be able to:
- ✅ Configure S3 lifecycle rules
- ✅ Transition objects between storage classes
- ✅ Expire old object versions automatically
- ✅ Understand S3 storage class cost differences
- ✅ Implement cost optimization patterns
- ✅ Use lifecycle rules to manage versioned buckets

## Common Mistakes

❌ **Mixing current and noncurrent transitions in one rule**
- Use separate rules for current vs noncurrent versions
- Keeps configuration clearer and more maintainable

❌ **Transitions to cheaper classes too quickly**
- STANDARD_IA has a 30-day minimum charge
- Moving before 30 days doesn't save money

❌ **Not enabling the rule**
- `status = "Enabled"` is required
- `status = "Disabled"` won't execute

❌ **Forgetting to enable versioning first**
- Noncurrent version rules require versioning
- Enable versioning before creating lifecycle rules

❌ **Invalid storage class transitions**
- Can't go from STANDARD to DEEP_ARCHIVE directly
- Must follow transition path: STANDARD → IA → GLACIER → DEEP_ARCHIVE

## Key Concepts

### Current vs Noncurrent Versions
- **Current version**: Latest version of an object
- **Noncurrent versions**: Previous versions after new upload
- Different lifecycle rules for each

### Transition Actions
Move objects to cheaper storage classes:
```hcl
transition {
  days          = 30
  storage_class = "STANDARD_IA"
}
```

### Expiration Actions
Delete objects after specified time:
```hcl
expiration {
  days = 365  # Delete current version after 1 year
}

noncurrent_version_expiration {
  noncurrent_days = 90  # Delete old versions after 90 days
}
```

### Filters
Apply rules to specific objects:
```hcl
filter {
  prefix = "logs/"  # Only applies to objects starting with "logs/"
}

filter {
  tag {
    key   = "Archive"
    value = "true"
  }
}
```

## Real-World Cost Optimization Patterns

### Pattern 1: Log File Management
```hcl
# Logs: Recent → IA → Glacier → Delete
rule {
  id     = "log-lifecycle"
  status = "Enabled"

  filter {
    prefix = "logs/"
  }

  transition {
    days          = 30
    storage_class = "STANDARD_IA"
  }

  transition {
    days          = 90
    storage_class = "GLACIER_FLEXIBLE"
  }

  expiration {
    days = 365
  }
}
```

### Pattern 2: Backup Retention
```hcl
# Keep only last 30 days of versions
rule {
  id     = "backup-retention"
  status = "Enabled"

  noncurrent_version_expiration {
    noncurrent_days = 30
  }
}
```

### Pattern 3: Cost-Optimized Storage
```hcl
# Automatically optimize storage costs
rule {
  id     = "intelligent-tiering"
  status = "Enabled"

  transition {
    days          = 0  # Immediate
    storage_class = "INTELLIGENT_TIERING"
  }
}
```

## Challenge Extensions

After completing the basic exercise, try these challenges:

**Challenge 1: Multi-tier transition**
- Transition to IA after 30 days
- Then to Glacier after 90 days
- Finally to Deep Archive after 365 days

**Challenge 2: Filtered rules**
- Create different rules for different prefixes
- Example: "logs/" vs "backups/" vs "archive/"

**Challenge 3: Abort incomplete multipart uploads**
- Add a rule to clean up incomplete uploads after 7 days
- Use `abort_incomplete_multipart_upload` block

**Challenge 4: Tag-based lifecycle**
- Create a rule that only applies to objects with specific tags
- Use `filter { and { tag { ... } } }` syntax

## Verification Commands

```bash
# View lifecycle configuration
aws s3api get-bucket-lifecycle-configuration \
  --bucket terraform-gym-04-YOUR-NAME | jq

# View versioning status
aws s3api get-bucket-versioning \
  --bucket terraform-gym-04-YOUR-NAME

# Test with actual objects (optional - creates small file)
echo "test content" > test.txt
aws s3 cp test.txt s3://terraform-gym-04-YOUR-NAME/

# Check object details
aws s3api head-object \
  --bucket terraform-gym-04-YOUR-NAME \
  --key test.txt

# Clean up test object
aws s3 rm s3://terraform-gym-04-YOUR-NAME/test.txt
```

## Cost Savings Examples

For a bucket with 1TB of data:

| Scenario | Storage Class | Monthly Cost | Annual Savings |
|----------|---------------|--------------|----------------|
| All STANDARD | STANDARD | $23.00 | - |
| Transition > 30d | STANDARD_IA | $12.50 | $126/year |
| Transition > 90d | GLACIER | $3.60 | $233/year |
| Transition > 180d | DEEP_ARCHIVE | $0.99 | $264/year |

**Key insight**: Lifecycle rules can save significant costs on large buckets with infrequent access patterns.

## Next Steps

Once you complete this exercise:
- Try the **S3 Challenge** to combine all S3 skills
- Experiment: Add expiration rules for current versions
- Challenge: Create a complete data retention policy

## Time Breakdown

- Read instructions: 4 min
- Add lifecycle rules: 10 min
- Understand storage classes: 5 min
- Test and verify: 4 min
- Cleanup: 2 min
- **Total**: ~25 minutes

## Related Course Material

- Course: Cost optimization and tagging
- AWS Docs: [S3 Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/userguide/object-lifecycle-mgmt.html)
- AWS Docs: [Storage Classes](https://aws.amazon.com/s3/storage-classes/)
- Terraform Docs: [aws_s3_bucket_lifecycle_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)

## Real-World Use Cases

This pattern is used for:
- **Application logs**: Transition old logs to cheaper storage
- **Backup retention**: Delete old backups automatically
- **Compliance**: Retain data for required periods, then delete
- **Media archives**: Move old videos/photos to Glacier
- **Data lake optimization**: Tiered storage for analytics data
- **Disaster recovery**: Long-term backup storage in Deep Archive
