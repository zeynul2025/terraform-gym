# Foundations Challenge: Complete Terraform Configuration

**Time**: 60 minutes | **Difficulty**: Intermediate | **Cost**: $0.00

## 🎯 Challenge Overview

Build a complete, production-quality Terraform configuration from scratch that demonstrates ALL foundation concepts. **NO skeleton code provided!**

## 📋 Requirements

Create a Terraform configuration with:

### 1. Variables (5+ variables required)
- **String**: environment (validated: dev/staging/prod)
- **String**: project_name
- **Number**: bucket_count (min: 1, max: 5)
- **Bool**: enable_encryption
- **Map**: common_tags
- All variables must have descriptions
- At least 2 variables must have validation rules

### 2. Data Sources (3 required)
- AWS caller identity (get account ID)
- AWS region (get current region)
- AWS availability zones (get list of AZs)

### 3. Locals (3+ computed values)
- Bucket name prefix combining project and environment
- All tags (merge common_tags with specific tags)
- Resource identifiers using account ID and region

### 4. Resources (Multiple S3 buckets)
- Use `count` to create multiple buckets
- Bucket names must be unique and follow pattern
- Conditional encryption based on variable
- Conditional versioning based on environment

### 5. Outputs (6+ outputs)
- All bucket names (as list)
- All bucket ARNs (as list)
- AWS account ID (from data source)
- Current region (from data source)
- Common tags used (mark as sensitive for practice)
- Environment type

### 6. Advanced Features (NEW - research required!)

**Count**:
```hcl
resource "aws_s3_bucket" "buckets" {
  count = var.bucket_count
  # Create multiple resources
}
```

**For_each**:
```hcl
resource "aws_s3_bucket" "named_buckets" {
  for_each = toset(var.bucket_names)
  # Create resources from set
}
```

**Dynamic Blocks**:
```hcl
dynamic "lifecycle_rule" {
  for_each = var.enable_lifecycle ? [1] : []
  # Conditionally create nested blocks
}
```

## 📚 Documentation Resources

### Core Concepts (from exercises)
- [Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Outputs](https://developer.hashicorp.com/terraform/language/values/outputs)
- [Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)
- [Locals](https://developer.hashicorp.com/terraform/language/values/locals)

### Advanced (research required!)
- [Count Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/count)
- [For_each Meta-Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
- [Dynamic Blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks)
- [Functions](https://developer.hashicorp.com/terraform/language/functions)

## ✅ Success Criteria

- ✅ All 5 variable types used
- ✅ Variable validation working
- ✅ All 3 data sources implemented
- ✅ Locals computing correct values
- ✅ Multiple resources created with count
- ✅ Conditional logic working
- ✅ All outputs defined and accurate
- ✅ Code properly formatted
- ✅ tfvars file provided
- ✅ Score 90+ on validator

## 🚫 Rules

- No skeleton code - start from blank files
- No TODOs - figure it out from requirements
- Must use concepts from ALL exercises
- Try for 45+ minutes before checking solution

## 💡 Hints

<details>
<summary>Hint 1: File structure</summary>

Create these files:
- `main.tf` - Resources and provider
- `variables.tf` - All variable declarations
- `locals.tf` - Local values
- `data.tf` - Data sources
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable values
- `.gitignore` - Ignore state files
</details>

<details>
<summary>Hint 2: Count example</summary>

```hcl
resource "aws_s3_bucket" "buckets" {
  count = var.bucket_count

  bucket = "${local.bucket_prefix}-${count.index}"

  tags = local.all_tags
}

# Reference with:
# aws_s3_bucket.buckets[0]
# aws_s3_bucket.buckets[*].id  # All IDs
```
</details>

<details>
<summary>Hint 3: Conditional resources</summary>

```hcl
# Only create if condition is true
resource "aws_s3_bucket_versioning" "versioning" {
  count = var.environment == "prod" ? var.bucket_count : 0

  bucket = aws_s3_bucket.buckets[count.index].id

  versioning_configuration {
    status = "Enabled"
  }
}
```
</details>

<details>
<summary>Hint 4: Locals pattern</summary>

```hcl
locals {
  bucket_prefix = "${var.project_name}-${var.environment}"

  all_tags = merge(
    var.common_tags,
    {
      Environment = var.environment
      AccountId   = data.aws_caller_identity.current.account_id
    }
  )
}
```
</details>

## 🎓 Learning Objectives

This challenge tests:
- ✅ Understanding of all variable types
- ✅ Ability to validate inputs
- ✅ Using data sources effectively
- ✅ Computing values with locals
- ✅ Creating multiple resources with count
- ✅ Conditional resource creation
- ✅ Output organization
- ✅ Reading Terraform documentation
- ✅ Writing production-quality configurations

## 🎯 Example Architecture

Your configuration should create:

```
Project: myapp, Environment: dev, Count: 3

Resources Created:
├── S3 Buckets (3)
│   ├── myapp-dev-0 (with encryption, no versioning)
│   ├── myapp-dev-1 (with encryption, no versioning)
│   └── myapp-dev-2 (with encryption, no versioning)
│
└── Conditional Resources (based on environment)
    ├── Versioning (only if prod)
    └── Lifecycle Rules (only if enabled)

Data Sources:
├── AWS Account ID: 123456789012
├── Region: us-east-1
└── Availability Zones: [us-east-1a, us-east-1b, ...]
```

## 📝 Verification Checklist

Before submitting:

- [ ] `terraform fmt -check` passes
- [ ] `terraform validate` passes
- [ ] `terraform plan` succeeds
- [ ] Variable validation catches invalid inputs
- [ ] Count creates correct number of resources
- [ ] Conditional resources only created when expected
- [ ] All outputs work correctly
- [ ] Can change variables and re-apply
- [ ] `terraform destroy` removes everything

## 🔍 Test Your Configuration

```bash
# Test variable validation
terraform plan -var="environment=invalid"  # Should error

# Test count
terraform plan -var="bucket_count=3"       # Should show 3 buckets

# Test conditional logic
terraform plan -var="environment=prod"     # Should show versioning
terraform plan -var="environment=dev"      # Should not show versioning

# View outputs
terraform apply
terraform output
```

## 💭 Reflection Questions

After completing:
1. What was hardest to figure out?
2. Which concept did you need to research most?
3. How would you organize this for a team?
4. What would you add for production use?
5. How confident are you with Terraform now?

---

**This is your Terraform foundations final exam!** Show what you've learned. Good luck! 📚
