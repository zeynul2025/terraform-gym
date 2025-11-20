# S3 Challenge: Production-Ready S3 Bucket

**Time**: 45-60 minutes
**Difficulty**: Challenge (No TODOs provided!)
**Cost**: $0.00 (free tier eligible)

## 🎯 Challenge Overview

You've completed the S3 exercise series! Now it's time to prove your mastery by creating a production-ready S3 bucket **from scratch**. Unlike previous exercises, this challenge provides **NO skeleton code or TODOs**. You must figure out the implementation using Terraform documentation.

## 📋 Requirements

Create a Terraform configuration that deploys an S3 bucket with ALL of the following features:

### Required Resources

1. **S3 Bucket**
   - Name: `terraform-gym-challenge-{your-name}`
   - All 5 required tags (Name, Environment, ManagedBy, Student, AutoTeardown)

2. **Versioning**
   - Status: Enabled

3. **Encryption**
   - Server-side encryption: AES256

4. **Public Access Block**
   - Block all public access (all 4 settings = true)

5. **Bucket Policy**
   - Allow your AWS account root to perform:
     - s3:GetObject
     - s3:PutObject
     - s3:ListBucket
     - s3:DeleteObject
   - Use `jsonencode()` for the policy
   - Use `data.aws_caller_identity` for account ID

6. **Lifecycle Rules**
   - Rule 1: Transition current objects to STANDARD_IA after 30 days
   - Rule 2: Transition current objects to GLACIER_FLEXIBLE after 90 days
   - Rule 3: Expire noncurrent versions after 60 days
   - Rule 4: Abort incomplete multipart uploads after 7 days

7. **Logging** (NEW - not covered in exercises!)
   - Create a second bucket for logs: `terraform-gym-challenge-{your-name}-logs`
   - Configure the main bucket to send access logs to the log bucket
   - Target prefix: `access-logs/`

8. **Object Lock** (NEW - not covered in exercises!)
   - Enable object lock on the bucket
   - Configure default retention for 30 days in GOVERNANCE mode

9. **Outputs**
   - bucket_name
   - bucket_arn
   - log_bucket_name
   - versioning_status
   - aws_account_id

## 📚 Documentation Resources

You'll need to research these Terraform resources:

### Core Resources (from exercises)
- [aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
- [aws_s3_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning)
- [aws_s3_bucket_server_side_encryption_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration)
- [aws_s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block)
- [aws_s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy)
- [aws_s3_bucket_lifecycle_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)

### New Resources (not in exercises - you must research!)
- [aws_s3_bucket_logging](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging)
- [aws_s3_bucket_object_lock_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration)

### Data Sources
- [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)

## 🚫 Rules

- **No TODOs provided** - You start with blank files
- **No skeleton code** - Create everything from scratch
- **No peeking at solution** - Try for at least 45 minutes first
- **Use documentation** - This is a research exercise!
- **All features required** - Missing features = incomplete challenge

## ✅ Success Criteria

Your configuration must:
- ✅ Pass `terraform fmt -check`
- ✅ Pass `terraform validate`
- ✅ Create exactly 9 resources (2 buckets + 7 configurations)
- ✅ Deploy successfully with `terraform apply`
- ✅ Have all outputs defined and working
- ✅ Include all required features listed above
- ✅ Pass the automated validator

## 📝 Getting Started

1. **Create your workspace**
   ```bash
   mkdir my-solution
   cd my-solution
   ```

2. **Create empty files**
   ```bash
   touch main.tf variables.tf outputs.tf
   ```

3. **Start building**
   - Begin with the terraform and provider blocks
   - Add resources one at a time
   - Test frequently with `terraform plan`
   - Use `terraform validate` to catch errors

4. **Research as you go**
   - Open the Terraform documentation links above
   - Read the resource arguments and examples
   - Understand what each argument does
   - Copy/adapt example code

## 💡 Strategic Tips

### Recommended Order
1. Start with `main.tf` - terraform and provider blocks
2. Add the main S3 bucket
3. Add versioning and encryption (you know these!)
4. Add public access block
5. Add bucket policy with data source
6. Add lifecycle configuration with all 4 rules
7. **Research** logging - create log bucket first, then configure logging
8. **Research** object lock - this is tricky, read docs carefully!
9. Create `outputs.tf` with all required outputs
10. Create `variables.tf` with student_name and region

### Common Challenges

**Object Lock gotcha:**
- Object lock must be enabled AT BUCKET CREATION
- Add `object_lock_enabled = true` to aws_s3_bucket
- Configure retention separately with aws_s3_bucket_object_lock_configuration

**Logging gotcha:**
- Log bucket needs a special bucket policy
- Target bucket can grant log-delivery-write permission
- Or use `aws_s3_bucket_acl` with `log-delivery-write` grant

**Lifecycle multiple rules:**
- You can have multiple rules in one resource
- Each rule needs a unique ID
- Abort multipart upload is in `abort_incomplete_multipart_upload` block

### Testing Strategy

Test incrementally:
```bash
# After each resource addition:
terraform fmt
terraform validate
terraform plan

# When you think you're done:
terraform apply

# Then verify each feature:
aws s3api get-bucket-versioning --bucket YOUR-BUCKET-NAME
aws s3api get-bucket-encryption --bucket YOUR-BUCKET-NAME
aws s3api get-bucket-policy --bucket YOUR-BUCKET-NAME | jq
aws s3api get-bucket-lifecycle-configuration --bucket YOUR-BUCKET-NAME | jq
aws s3api get-bucket-logging --bucket YOUR-BUCKET-NAME
aws s3api get-object-lock-configuration --bucket YOUR-BUCKET-NAME
```

## 🎓 Learning Objectives

This challenge tests your ability to:
- ✅ Read and understand Terraform documentation
- ✅ Research unfamiliar resources independently
- ✅ Combine multiple S3 features in one configuration
- ✅ Debug configuration errors
- ✅ Follow AWS best practices
- ✅ Create production-ready infrastructure

## ⏱️ Time Breakdown (Estimated)

- Research logging and object lock: 15 min
- Build main configuration: 20 min
- Debug and test: 15 min
- Verify all features: 10 min
- **Total**: ~60 minutes (for first attempt)

**Pro tip**: If you can complete this in under 45 minutes, you've truly mastered S3 configuration!

## 🏆 Scoring

The validator will score your solution:

| Category | Points | What's Checked |
|----------|--------|----------------|
| Code Quality | 15 | Formatting, validation, structure |
| Core Features | 30 | Bucket, versioning, encryption, PAB |
| Policies | 20 | Bucket policy with correct permissions |
| Lifecycle | 20 | All 4 lifecycle rules configured |
| Advanced | 10 | Logging configuration |
| Expert | 5 | Object lock configuration |
| **Total** | **100** | |

**Target score**: 90+ (Expert level)

## 🔍 Verification Checklist

Before running the validator, manually verify:

- [ ] Terraform fmt shows no changes needed
- [ ] Terraform validate succeeds
- [ ] Terraform plan shows 9 resources to create
- [ ] Terraform apply succeeds
- [ ] Versioning is enabled
- [ ] Encryption is enabled (AES256)
- [ ] Public access is blocked (all 4 settings)
- [ ] Bucket policy exists and allows required actions
- [ ] 4 lifecycle rules are configured
- [ ] Logging is configured to log bucket
- [ ] Object lock is enabled with 30-day retention
- [ ] All outputs work (`terraform output`)
- [ ] All tags are present on both buckets

## 🎯 Running the Validator

```bash
cd ..  # Back to challenge directory
./.validator/validate.sh my-solution
```

The validator will:
- Check all resources are created
- Verify configuration correctness
- Test actual AWS resources
- Calculate your score
- Provide detailed feedback

## 🧹 Cleanup

**IMPORTANT**: Two buckets to destroy!

```bash
cd my-solution
terraform destroy
# Type 'yes' to confirm

# Verify both buckets are gone
aws s3 ls | grep terraform-gym-challenge
```

## 🤔 Stuck?

### After 20 minutes
- Review the exercise series (01-04) for examples
- Check your terraform validate errors carefully
- Make sure you're reading the correct documentation sections

### After 40 minutes
- Look at hints in previous exercise READMEs
- Try building one resource at a time
- Use `terraform plan` to see what's missing

### After 60 minutes
- Check the solution/ directory for reference
- Compare your approach to the solution
- Understand WHY the solution works

## 🎉 Completion

Once you pass the validator with 90+ points:
- 🎊 Congratulations! You've mastered S3 configuration!
- 📸 Screenshot your score
- 🔄 Try the challenge again in a week to reinforce learning
- ➡️ Move on to the next topic series (IAM, VPC, etc.)

## 💭 Reflection Questions

After completing the challenge, consider:
1. What was the hardest part?
2. Which resource took the most time to research?
3. What would you do differently next time?
4. What did you learn about reading documentation?
5. Could you build this from memory now?

## 🚀 Next Steps

After mastering this challenge:
- Complete other topic series (IAM, VPC, State Management)
- Try building this bucket using a Terraform module
- Add additional features like replication or inventory
- Explore S3 batch operations configuration

---

**Remember**: The goal isn't just to complete the challenge, but to learn how to research and implement Terraform resources independently. This skill is essential for real-world infrastructure work!

Good luck! 🍀
