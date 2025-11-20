# Exercise 02: Variables and Outputs

**Time**: 25 minutes | **Difficulty**: Beginner | **Cost**: $0.00

## Objective

Master Terraform variables (inputs) and outputs. Learn variable types, validation, and how to make configurations reusable.

## What You'll Practice

- Declaring variables with types
- Setting default values
- Using terraform.tfvars
- Variable validation rules
- Creating outputs
- Sensitive outputs
- Variable precedence

## Instructions

1. Create variables for bucket name and environment
2. Use different variable types (string, number, bool, list, map)
3. Add variable validation
4. Create terraform.tfvars file
5. Create outputs for bucket details
6. Mark sensitive outputs appropriately

## Success Criteria

- ✅ All variable types demonstrated
- ✅ Variables used in resources
- ✅ Validation rules working
- ✅ tfvars file created
- ✅ Outputs showing correct values
- ✅ Sensitive outputs hidden in console

## Key Concepts

### Variable Types

**String**:
```hcl
variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
  default     = "my-bucket"
}
```

**Number**:
```hcl
variable "max_size" {
  type    = number
  default = 100
}
```

**Bool**:
```hcl
variable "enable_versioning" {
  type    = bool
  default = true
}
```

**List**:
```hcl
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
```

**Map**:
```hcl
variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Team        = "platform"
  }
}
```

**Object** (complex type):
```hcl
variable "bucket_config" {
  type = object({
    name    = string
    versioned = bool
    tags    = map(string)
  })
}
```

### Variable Validation

```hcl
variable "environment" {
  type = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}
```

### Using Variables

```hcl
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name           # Use variable

  tags = var.tags                    # Use map variable
}
```

### Outputs

```hcl
output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.example.arn
  sensitive   = false  # Not sensitive
}
```

### Sensitive Outputs

```hcl
output "secret_value" {
  description = "A sensitive value"
  value       = aws_iam_access_key.example.secret
  sensitive   = true  # Hidden from console
}
```

## Variable Precedence (highest to lowest)

1. Command line: `-var="key=value"`
2. `*.auto.tfvars` files
3. `terraform.tfvars` file
4. Environment variables: `TF_VAR_name`
5. Default value in variable declaration
6. Manual input (if no default)

## terraform.tfvars Format

```hcl
# Simple values
bucket_name  = "my-production-bucket"
environment  = "prod"
max_size     = 500

# List
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Map
tags = {
  Environment = "prod"
  Owner       = "platform-team"
  CostCenter  = "engineering"
}
```

## Best Practices

### 1. Always Add Descriptions
```hcl
variable "bucket_name" {
  description = "Name of the S3 bucket for application data"  # Clear!
  type        = string
}
```

### 2. Use Validation for Enums
```hcl
variable "instance_type" {
  type = string

  validation {
    condition     = contains(["t2.micro", "t2.small", "t2.medium"], var.instance_type)
    error_message = "Instance type must be t2.micro, t2.small, or t2.medium."
  }
}
```

### 3. Group Related Variables
```hcl
variable "database_config" {
  type = object({
    engine         = string
    instance_class = string
    storage_size   = number
  })

  description = "Database configuration settings"
}
```

### 4. Use Sensitive for Secrets
```hcl
variable "database_password" {
  type      = string
  sensitive = true  # Won't show in logs
}
```

## Common Patterns

### Environment-Specific Configs
```hcl
# variables.tf
variable "environment" {
  type = string
}

# Use in resources
resource "aws_s3_bucket" "data" {
  bucket = "app-${var.environment}-data"

  tags = {
    Environment = var.environment
  }
}
```

### Dynamic Tagging
```hcl
variable "common_tags" {
  type = map(string)
  default = {
    ManagedBy = "Terraform"
    Team      = "Platform"
  }
}

resource "aws_s3_bucket" "example" {
  tags = merge(
    var.common_tags,
    {
      Name = "specific-bucket-name"
    }
  )
}
```

## Querying Outputs

```bash
# View all outputs
terraform output

# Get specific output
terraform output bucket_name

# Get as JSON
terraform output -json

# Use in scripts
BUCKET=$(terraform output -raw bucket_name)
echo "Bucket is: $BUCKET"
```

## Related Docs

- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Output Values](https://developer.hashicorp.com/terraform/language/values/outputs)
- [Variable Validation](https://developer.hashicorp.com/terraform/language/values/variables#custom-validation-rules)
