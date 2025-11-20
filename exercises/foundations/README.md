# Foundations Exercise Series

Master core Terraform concepts before diving into AWS services. Perfect for absolute beginners or those coming from other IaC tools.

## 📚 Series Overview

This series teaches fundamental Terraform concepts using simple examples. Focus is on **how Terraform works**, not AWS complexity. After completing this series, you'll be ready for any AWS service series.

**Total Time**: ~100 minutes (exercises) + 60 minutes (challenge)
**Difficulty Progression**: Absolute Beginner → Beginner → Intermediate
**Cost**: $0.00 (uses minimal S3 resources)

## 🎯 Learning Path

### Exercise 01: Terraform Basics ⭐
**Time**: 20 minutes | **Difficulty**: Absolute Beginner

Learn HCL syntax, basic blocks, and the Terraform workflow.

**You'll learn**:
- HCL syntax fundamentals
- Terraform block vs provider block
- Resource blocks and arguments
- The init → plan → apply workflow
- Formatting and validation

**Path**: `exercise-01-terraform-basics/`

---

### Exercise 02: Variables and Outputs ⭐
**Time**: 25 minutes | **Difficulty**: Beginner

Master input variables, output values, and variable files.

**You'll learn**:
- Declaring variables (types, defaults, validation)
- Using variables in resources
- Creating useful outputs
- terraform.tfvars files
- Variable precedence and sensitive values

**Path**: `exercise-02-variables-outputs/`

---

### Exercise 03: Data Sources ⭐⭐
**Time**: 25 minutes | **Difficulty**: Beginner

Use data sources to read existing infrastructure.

**You'll learn**:
- Data sources vs resources
- Reading existing AWS resources
- Using data source outputs
- Common data sources (caller_identity, region, availability_zones)
- When to use data sources

**Path**: `exercise-03-data-sources/`

---

### Exercise 04: Locals and Functions ⭐⭐
**Time**: 30 minutes | **Difficulty**: Intermediate

Work with local values, expressions, and built-in functions.

**You'll learn**:
- Local values for computed data
- String functions (format, join, split)
- Collection functions (merge, concat, keys)
- Conditional expressions (? :)
- For expressions

**Path**: `exercise-04-locals-functions/`

---

### Challenge: Complete Configuration ⭐⭐⭐
**Time**: 60 minutes | **Difficulty**: Intermediate

**🚨 COMBINE ALL FOUNDATION CONCEPTS!**

Build a complete Terraform configuration from scratch using only Terraform documentation.

**Requirements**:
- Use variables with validation
- Create multiple resources with dependencies
- Use data sources to read AWS account info
- Use locals for computed values
- Implement conditional logic
- Create comprehensive outputs
- PLUS: Count and for_each (new!)
- PLUS: Dynamic blocks (new!)

**Path**: `challenge-complete-config/`

---

## 🗺️ Quick Navigation

| Exercise | Time | Difficulty | Status |
|----------|------|------------|--------|
| [01: Terraform Basics](exercise-01-terraform-basics/) | 20 min | ⭐ Beginner | ✅ Ready |
| [02: Variables & Outputs](exercise-02-variables-outputs/) | 25 min | ⭐ Beginner | ✅ Ready |
| [03: Data Sources](exercise-03-data-sources/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [04: Locals & Functions](exercise-04-locals-functions/) | 30 min | ⭐⭐ Intermediate | ✅ Ready |
| [Challenge: Complete Config](challenge-complete-config/) | 60 min | ⭐⭐⭐ Advanced | ✅ Ready |

## 📖 What You'll Master

### Core Terraform Concepts
- ✅ HCL syntax and structure
- ✅ Terraform workflow (init, plan, apply, destroy)
- ✅ Configuration blocks (terraform, provider, resource)
- ✅ Input variables (all types)
- ✅ Output values
- ✅ Data sources
- ✅ Local values
- ✅ Expressions and functions
- ✅ Dependencies (explicit and implicit)

### Advanced Concepts (Challenge)
- ✅ Count and for_each
- ✅ Dynamic blocks
- ✅ Complex expressions
- ✅ Conditional resource creation
- ✅ Advanced functions

### Best Practices
- ✅ File organization
- ✅ Naming conventions
- ✅ Documentation with descriptions
- ✅ Variable validation
- ✅ Sensitive value handling
- ✅ DRY principles (locals, variables)

## 💰 Cost Information

**All exercises are FREE**:
- Uses only S3 buckets (empty)
- Total cost: $0.00
- Safe for practice and repetition

## 🎓 Why Start Here?

### Before AWS Services
This series teaches **how Terraform works** without AWS complexity:
- Focus on syntax, not service details
- Understand concepts before applying them
- Build muscle memory for workflow
- Learn to read Terraform documentation

### Perfect For
- **Absolute beginners** to Terraform
- **Switching from** CloudFormation, Pulumi, Ansible
- **Before the main course** - build foundation first
- **Refreshing knowledge** after time away

## 📊 Skills Matrix

| Skill | Ex 01 | Ex 02 | Ex 03 | Ex 04 | Challenge |
|-------|-------|-------|-------|-------|-----------|
| HCL Syntax | ✅ | ✅ | ✅ | ✅ | ✅ |
| Blocks (terraform, provider) | ✅ | ✅ | ✅ | ✅ | ✅ |
| Resources | ✅ | ✅ | ✅ | ✅ | ✅ |
| Variables | | ✅ | ✅ | ✅ | ✅ |
| Outputs | | ✅ | ✅ | ✅ | ✅ |
| Data sources | | | ✅ | ✅ | ✅ |
| Locals | | | | ✅ | ✅ |
| Functions | | | | ✅ | ✅ |
| Count/for_each | | | | | ✅ |
| Dynamic blocks | | | | | ✅ |

## 🔗 Recommended Learning Path

### Complete Beginner Path
```
Foundations (all exercises)
    ↓
S3 Series (storage basics)
    ↓
IAM Series (access control)
    ↓
VPC Series (networking)
    ↓
State Series (advanced)
```

### Quick Start Path (some programming experience)
```
Foundations Ex 01-02 (45 min)
    ↓
Skip to S3 Series
    ↓
Return to Foundations Ex 03-04 when needed
```

### Reference Path (experienced with IaC)
```
Foundations Challenge only (60 min)
    ↓
Review specific exercises as needed
    ↓
Jump to AWS service series
```

## 🎯 Key Terraform Concepts

### HCL (HashiCorp Configuration Language)
```hcl
# Block type with label(s)
resource "aws_s3_bucket" "example" {
  # Arguments
  bucket = "my-bucket"

  # Nested blocks
  tags = {
    Name = "My Bucket"
  }
}
```

### The Terraform Workflow
```bash
terraform init      # Download providers
terraform fmt       # Format code
terraform validate  # Check syntax
terraform plan      # Preview changes
terraform apply     # Make changes
terraform destroy   # Clean up
```

### Variables
```hcl
variable "name" {
  description = "Human readable description"
  type        = string
  default     = "default-value"

  validation {
    condition     = length(var.name) > 3
    error_message = "Name too short"
  }
}
```

### Outputs
```hcl
output "bucket_name" {
  description = "Name of the created bucket"
  value       = aws_s3_bucket.example.id
  sensitive   = false
}
```

### Data Sources
```hcl
data "aws_caller_identity" "current" {}

# Use the data source
output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
```

### Locals
```hcl
locals {
  common_tags = {
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }

  bucket_name = "app-${var.environment}-${var.region}"
}

# Use locals
resource "aws_s3_bucket" "example" {
  bucket = local.bucket_name
  tags   = local.common_tags
}
```

## 💡 Pro Tips

### 1. Always Run These Before Apply
```bash
terraform fmt && terraform validate && terraform plan
```

### 2. Use Descriptive Names
```hcl
# Good
resource "aws_s3_bucket" "application_data_bucket" { }

# Bad
resource "aws_s3_bucket" "b1" { }
```

### 3. Document Everything
```hcl
variable "instance_count" {
  description = "Number of EC2 instances to create for the web tier"
  type        = number
  default     = 2
}
```

### 4. Use Locals for Repeated Values
```hcl
locals {
  common_tags = {
    Environment = var.environment
    Project     = "MyApp"
  }
}

# Reuse everywhere
resource "aws_s3_bucket" "bucket1" {
  tags = local.common_tags
}

resource "aws_s3_bucket" "bucket2" {
  tags = local.common_tags
}
```

### 5. Validate Variable Inputs
```hcl
variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod"
  }
}
```

## 🆘 Common Beginner Mistakes

### Mistake 1: Forgetting Required Blocks
```hcl
# Missing terraform block!
provider "aws" {
  region = "us-east-1"
}
```
**Fix**: Always include terraform block with version constraints

### Mistake 2: Using Undefined Variables
```hcl
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name  # Variable not declared!
}
```
**Fix**: Declare all variables in variables.tf

### Mistake 3: Not Using Outputs
```hcl
# Created resources but no outputs
resource "aws_s3_bucket" "data" {
  bucket = "my-bucket"
}
# How do I get the bucket ARN?
```
**Fix**: Create outputs for important values

### Mistake 4: Hardcoding Values
```hcl
# Bad
resource "aws_s3_bucket" "example" {
  bucket = "my-hardcoded-bucket-name"
}

# Good
resource "aws_s3_bucket" "example" {
  bucket = "app-${var.environment}-data"
}
```

### Mistake 5: Not Running fmt/validate
```hcl
resource "aws_s3_bucket" "example"    {
bucket="no-spacing"
  tags={
environment="dev"}}
```
**Fix**: Run `terraform fmt` before committing

## 🔧 Terraform CLI Quick Reference

### Essential Commands
```bash
# Initialize
terraform init

# Format code
terraform fmt
terraform fmt -recursive      # Format all .tf files
terraform fmt -check          # Check without modifying

# Validate
terraform validate

# Plan
terraform plan
terraform plan -out=tfplan    # Save plan
terraform show tfplan         # View saved plan

# Apply
terraform apply
terraform apply tfplan        # Apply saved plan
terraform apply -auto-approve # Skip confirmation (careful!)

# Destroy
terraform destroy
terraform destroy -target=aws_s3_bucket.example  # Destroy specific resource

# Outputs
terraform output
terraform output bucket_name  # Get specific output
terraform output -json        # JSON format
```

### Helpful Flags
```bash
-var="key=value"              # Set variable
-var-file="custom.tfvars"     # Use variable file
-target=RESOURCE              # Target specific resource
-refresh=false                # Don't refresh state
```

## 📚 Further Reading

After completing this series:
- [Terraform Language Docs](https://developer.hashicorp.com/terraform/language)
- [HCL Syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration)
- [Functions](https://developer.hashicorp.com/terraform/language/functions)
- [Expressions](https://developer.hashicorp.com/terraform/language/expressions)

## 🚀 After This Series

Once you complete Foundations:

**Next Steps**:
1. **S3 Series** - Apply foundation concepts to storage
2. **IAM Series** - Learn access control patterns
3. **VPC Series** - Build network infrastructure
4. **State Series** - Master advanced Terraform

**You'll be ready to**:
- Start any AWS service series
- Read and understand Terraform code
- Write your own configurations
- Debug Terraform errors
- Work with teams on Terraform projects

---

**Ready to start?** Begin with [Exercise 01: Terraform Basics](exercise-01-terraform-basics/)!

**Already know basics?** Jump to [Exercise 03](exercise-03-data-sources/) or the [Challenge](challenge-complete-config/)!
