# Exercise Index

Complete listing of all Terraform Gym exercises with difficulty ratings, time estimates, and learning outcomes.

## Quick Reference

| # | Exercise | Difficulty | Time | Topics |
|---|----------|------------|------|--------|
| 01 | [Basic S3 Bucket](#exercise-01-basic-s3-bucket) | Beginner | 15 min | HCL basics, providers, resources, tags |
| 02 | [S3 Versioning & Encryption](#exercise-02-s3-versioning--encryption) | Beginner | 20 min | Resource references, nested blocks, outputs |
| 03 | Remote State Backend | Beginner | 25 min | Backend configuration, state migration |
| 04 | Variables Deep Dive | Beginner | 20 min | Variable types, validation, defaults |
| 05 | Output Expressions | Beginner | 15 min | Output values, dependencies, sensitive data |

## Foundation Exercises (01-10)

### Exercise 01: Basic S3 Bucket
**Difficulty**: ⭐ Beginner
**Time**: 15 minutes
**Cost**: $0.00

**What You'll Learn:**
- Write terraform and provider blocks with version constraints
- Create an S3 bucket resource
- Apply consistent tagging
- Execute the Terraform workflow (init, plan, apply, destroy)

**Prerequisites**: None (good starting point!)

**Path**: `exercises/exercise-01-basic-s3/`

---

### Exercise 02: S3 Versioning & Encryption
**Difficulty**: ⭐ Beginner
**Time**: 20 minutes
**Cost**: $0.00

**What You'll Learn:**
- Create multiple related resources
- Use resource references to establish dependencies
- Configure nested blocks
- Enable S3 versioning and encryption
- Define useful outputs

**Prerequisites**: Exercise 01 or basic S3 knowledge

**Path**: `exercises/exercise-02-s3-versioning/`

---

### Exercise 03: Remote State Backend
**Difficulty**: ⭐⭐ Beginner
**Time**: 25 minutes
**Cost**: $0.00

**What You'll Learn:**
- Configure S3 backend for remote state
- Migrate from local to remote state
- Understand state locking with S3
- Manage backend configuration

**Prerequisites**: Exercise 01-02 or Course Lab 0

**Path**: `exercises/exercise-03-remote-state/`

**Status**: 🚧 Coming Soon

---

### Exercise 04: Variables Deep Dive
**Difficulty**: ⭐⭐ Beginner
**Time**: 20 minutes
**Cost**: $0.00

**What You'll Learn:**
- Use different variable types (string, number, bool, list, map)
- Set variable defaults and descriptions
- Use terraform.tfvars files
- Implement variable validation rules

**Prerequisites**: Exercise 01

**Path**: `exercises/exercise-04-variables/`

**Status**: 🚧 Coming Soon

---

### Exercise 05: Output Expressions
**Difficulty**: ⭐ Beginner
**Time**: 15 minutes
**Cost**: $0.00

**What You'll Learn:**
- Create outputs for resource attributes
- Mark outputs as sensitive
- Use outputs to expose useful information
- Chain outputs between modules

**Prerequisites**: Exercise 01-02

**Path**: `exercises/exercise-05-outputs/`

**Status**: 🚧 Coming Soon

---

### Exercise 06: Resource Dependencies
**Difficulty**: ⭐⭐ Beginner
**Time**: 20 minutes
**Cost**: $0.00

**What You'll Learn:**
- Understand implicit vs explicit dependencies
- Use depends_on for explicit ordering
- Visualize dependency graphs
- Control resource creation order

**Prerequisites**: Exercise 01-02

**Path**: `exercises/exercise-06-dependencies/`

**Status**: 🚧 Coming Soon

---

## State Management Exercises (11-15)

### Exercise 11: State Commands
**Difficulty**: ⭐⭐ Intermediate
**Time**: 25 minutes
**Cost**: $0.00

**What You'll Learn:**
- Use terraform state list/show/mv/rm
- Import existing AWS resources
- Manipulate state safely
- Recover from state issues

**Prerequisites**: Exercise 03 or understanding of remote state

**Path**: `exercises/exercise-11-state-commands/`

**Status**: 🚧 Coming Soon

---

## AWS Resource Patterns (16-25)

### Exercise 16: S3 Bucket Policies
**Difficulty**: ⭐⭐ Intermediate
**Time**: 30 minutes
**Cost**: $0.00

**What You'll Learn:**
- Create S3 bucket policies
- Work with JSON in Terraform
- Use jsonencode() function
- Implement access controls

**Prerequisites**: Exercise 01-02

**Path**: `exercises/exercise-16-s3-policies/`

**Status**: 🚧 Coming Soon

---

### Exercise 17: IAM User and Policies
**Difficulty**: ⭐⭐ Intermediate
**Time**: 25 minutes
**Cost**: $0.00

**What You'll Learn:**
- Create IAM users
- Attach policies to users
- Generate access keys (and understand risks)
- Implement least privilege access

**Prerequisites**: Understanding of AWS IAM basics

**Path**: `exercises/exercise-17-iam-basics/`

**Status**: 🚧 Coming Soon

---

## Module Exercises (26-35)

### Exercise 26: Your First Module
**Difficulty**: ⭐⭐ Intermediate
**Time**: 30 minutes
**Cost**: $0.00

**What You'll Learn:**
- Create a reusable Terraform module
- Define module inputs and outputs
- Use modules in root configuration
- Understand module structure

**Prerequisites**: Exercise 01-05

**Path**: `exercises/exercise-26-first-module/`

**Status**: 🚧 Coming Soon

---

## Advanced Patterns (36-50)

### Exercise 36: Dynamic Blocks
**Difficulty**: ⭐⭐⭐ Advanced
**Time**: 30 minutes
**Cost**: $0.01

**What You'll Learn:**
- Use dynamic blocks for repetitive nested blocks
- Iterate over lists with for_each
- Conditionally create nested blocks
- Real-world security group rules example

**Prerequisites**: Exercise 01-10

**Path**: `exercises/exercise-36-dynamic-blocks/`

**Status**: 🚧 Coming Soon

---

### Exercise 37: Count and For Each
**Difficulty**: ⭐⭐⭐ Advanced
**Time**: 30 minutes
**Cost**: $0.02

**What You'll Learn:**
- Create multiple resources with count
- Use for_each with maps and sets
- Understand count vs for_each trade-offs
- Access count.index and each.key

**Prerequisites**: Exercise 01-05

**Path**: `exercises/exercise-37-count-foreach/`

**Status**: 🚧 Coming Soon

---

## Cost Optimization Exercises (51-60)

### Exercise 51: Lifecycle Policies
**Difficulty**: ⭐⭐ Intermediate
**Time**: 25 minutes
**Cost**: $0.00

**What You'll Learn:**
- Configure S3 lifecycle policies
- Transition objects between storage classes
- Expire old versions automatically
- Optimize storage costs

**Prerequisites**: Exercise 02

**Path**: `exercises/exercise-51-lifecycle-policies/`

**Status**: 🚧 Coming Soon

---

## Exercise Progression Paths

### Path 1: S3 Mastery
Complete these exercises to master S3 configurations:
1. Exercise 01: Basic S3 Bucket
2. Exercise 02: S3 Versioning & Encryption
3. Exercise 16: S3 Bucket Policies
4. Exercise 51: Lifecycle Policies

**Total Time**: ~90 minutes

---

### Path 2: Terraform Fundamentals
Master core Terraform concepts:
1. Exercise 01: Basic S3 Bucket
2. Exercise 04: Variables Deep Dive
3. Exercise 05: Output Expressions
4. Exercise 06: Resource Dependencies
5. Exercise 03: Remote State Backend

**Total Time**: ~105 minutes

---

### Path 3: State Management
Become proficient with Terraform state:
1. Exercise 03: Remote State Backend
2. Exercise 11: State Commands
3. Exercise 12: State Migration (coming soon)

**Total Time**: ~70 minutes

---

### Path 4: Modules
Learn to create reusable infrastructure:
1. Exercise 26: Your First Module
2. Exercise 27: Module Composition (coming soon)
3. Exercise 28: Public Module Usage (coming soon)

**Total Time**: ~90 minutes

---

## Filtering Exercises

### By Difficulty

**Beginner (⭐)**
- Exercises 01, 02, 03, 04, 05

**Intermediate (⭐⭐)**
- Exercises 06, 11, 16, 17, 26, 51

**Advanced (⭐⭐⭐)**
- Exercises 36, 37

### By Time Available

**Quick (15 min or less)**
- Exercises 01, 05

**Standard (20-25 min)**
- Exercises 02, 03, 04, 06, 11, 17, 51

**Extended (30 min)**
- Exercises 16, 26, 36, 37

### By AWS Service

**S3**
- Exercises 01, 02, 16, 51

**IAM**
- Exercise 17

**State Management**
- Exercises 03, 11

**Multi-Service**
- Exercises 26+

## Legend

- ⭐ Beginner
- ⭐⭐ Intermediate
- ⭐⭐⭐ Advanced
- 🚧 Coming Soon
- ✅ Available

## Roadmap

Planned future exercises:

- **Exercise 08**: Local Values and Expressions
- **Exercise 09**: Conditional Resources
- **Exercise 10**: Data Sources
- **Exercise 12**: State Migration Scenarios
- **Exercise 13**: Terraform Workspace Basics
- **Exercise 14**: VPC and Subnets
- **Exercise 15**: Security Groups
- **Exercise 18**: EC2 Instance Basics
- **Exercise 27**: Module Composition
- **Exercise 28**: Using Public Modules
- **Exercise 38**: For Expressions
- **Exercise 52**: Auto-Shutdown Patterns
- **Exercise 53**: Budget Alerts

## Contributing

Want to add an exercise? See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

## Exercise Templates

Common patterns available in `common/templates/`:
- Basic resource exercise
- Multi-resource exercise
- Module exercise
- State manipulation exercise

## Support

- **Issues**: Report problems with specific exercises
- **Discussions**: Ask questions about exercise content
- **Pull Requests**: Contribute new exercises

---

**Last Updated**: 2025-11-20
**Total Exercises**: 2 available, 18+ planned
