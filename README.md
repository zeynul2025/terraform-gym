# Terraform Gym

**Quick, focused Terraform exercises to build muscle memory**

## Concept

Think of it like coding katas or LeetCode for Terraform - short, repeatable exercises that build proficiency with common infrastructure patterns. Each exercise takes 15-30 minutes and focuses on a single skill or concept.

## Why Terraform Gym?

The main [Terraform Course](https://github.com/shart-cloud/labs_terraform_course) provides comprehensive labs (3-5 hours each) that cover full deployment scenarios. The Terraform Gym complements this with:

- **Quick Practice**: 15-30 minute focused drills
- **Skill Isolation**: Each exercise targets one specific concept
- **Repetition**: Build muscle memory through repeated practice
- **Low Stakes**: Practice without affecting your lab grades
- **Flexible Timing**: Perfect for class downtime or warm-ups

## Exercise Format

Each exercise follows this structure:

```
exercise-XX/
├── README.md           # Instructions and learning objectives
├── skeleton/           # Starting point files
│   ├── main.tf        # Partial code with TODOs
│   └── variables.tf   # Pre-defined variables
├── solution/           # Reference solution (hidden until complete)
│   └── main.tf
└── .validator/         # Automated tests
    └── validate.sh
```

### Standard Exercise Components

Every exercise includes:

- **Time Estimate**: 15-30 minutes
- **Objective**: Single, clear goal
- **Prerequisites**: Required knowledge
- **Starting Point**: Skeleton files with TODOs
- **Success Criteria**: Automated validation
- **Cost Estimate**: Expected AWS cost (pennies or free-tier)
- **Hints**: Progressive hints if you get stuck
- **Learning Outcomes**: What you'll master

## Exercise Categories

### Foundation (Exercises 01-10)
Master basic Terraform syntax and workflows
- HCL syntax and structure
- Resource definitions
- Variables and outputs
- Basic AWS resources

### State Management (Exercises 11-15)
Practice state operations and backends
- Local vs remote state
- State migration
- State manipulation commands
- Backend configuration

### Resource Patterns (Exercises 16-25)
Common AWS resource configurations
- S3 bucket security patterns
- IAM role creation
- VPC and networking basics
- Security group patterns

### Advanced Patterns (Exercises 26-35)
More complex scenarios
- Module creation
- Dynamic blocks
- For expressions
- Conditional resources

### Cost Optimization (Exercises 36-40)
Practice cost-aware infrastructure
- Right-sizing resources
- Lifecycle policies
- Auto-shutdown patterns
- Budget tracking

## How to Use the Gym

### First Time Setup

1. **Fork and Clone** (if not already done for main course)
```bash
git clone https://github.com/YOUR-USERNAME/terraform-gym.git
cd terraform-gym
```

2. **Configure AWS** (one-time setup)
```bash
aws configure
# Use the same credentials as your main course
```

3. **Install Tools**
   - Terraform 1.9.0+
   - AWS CLI
   - Infracost (optional for cost exercises)

### Working on an Exercise

1. **Choose an exercise** based on what you want to practice
```bash
cd exercises/exercise-01-basic-s3
```

2. **Read the README** to understand the objective
```bash
cat README.md
```

3. **Copy skeleton to your workspace**
```bash
cp -r skeleton/ my-solution/
cd my-solution/
```

4. **Complete the TODOs** in the skeleton files
```bash
# Edit the files to complete the exercise
vim main.tf
```

5. **Test your solution**
```bash
terraform init
terraform validate
terraform plan
# If it looks good:
terraform apply
```

6. **Run validation**
```bash
cd ..
./.validator/validate.sh my-solution
```

7. **Clean up**
```bash
cd my-solution
terraform destroy
```

### Tips for Maximum Learning

- **Don't peek at solutions** until you've tried for 20+ minutes
- **Use hints progressively** - try without hints first
- **Repeat exercises** - redo them a week later to reinforce learning
- **Time yourself** - track improvement over time
- **Experiment** - try variations after completing the basic exercise
- **Share patterns** - if you find a better approach, share it!

## Exercise Progression

Exercises are numbered sequentially but can be done in any order based on your needs:

### Week 0 - Environment & Basics
After completing Course Lab 0, practice these:
- Exercise 01: Create a basic S3 bucket (15 min)
- Exercise 02: Add versioning and encryption (15 min)
- Exercise 03: Configure remote state backend (20 min)
- Exercise 04: Work with outputs (15 min)
- Exercise 05: Use variables effectively (20 min)

### Week 1 - Resource Dependencies
- Exercise 06: Create resources with explicit dependencies
- Exercise 07: Use resource references
- Exercise 08: Handle resource ordering

### Week 2 - State Operations
- Exercise 09: Import existing resources
- Exercise 10: Move resources between modules
- Exercise 11: Recover from state issues

### Week 3 - AWS Patterns
- Exercise 12: S3 bucket with policies
- Exercise 13: IAM user and policies
- Exercise 14: Basic VPC setup

### Week 4 - Modules
- Exercise 15: Create your first module
- Exercise 16: Use module inputs and outputs
- Exercise 17: Module composition

## Cost Management

All exercises are designed to be cost-conscious:

- **Free Tier Eligible**: Most exercises use free-tier resources
- **Minimal Duration**: Complete and destroy within 30 minutes
- **AutoTeardown Tags**: All resources tagged for auto-cleanup
- **Cost Estimates**: Each exercise shows expected cost
- **Budget Alerts**: Reuse your billing budget from main course

**Typical costs per exercise**: $0.00 - $0.02

## Validation

Each exercise includes automated validation:

```bash
# Run the validator
./.validator/validate.sh my-solution

# Example output:
✅ Terraform files formatted correctly
✅ Configuration is valid
✅ Required resources created
✅ Outputs are correct
✅ Tags are present
✅ Cost under budget

Score: 100/100
```

Validators check:
- Terraform formatting (`terraform fmt`)
- Configuration validity (`terraform validate`)
- Required resources exist
- Proper tagging
- Security best practices
- Cost estimates

## Integration with Main Course

The Terraform Gym is designed to work alongside the [main Terraform course](https://github.com/shart-cloud/labs_terraform_course):

| Main Course | Gym Exercises | Purpose |
|-------------|---------------|---------|
| Week 0 Lab 0 | Exercises 01-05 | Reinforce basics |
| Week 1 Labs | Exercises 06-08 | Practice dependencies |
| Week 2 Labs | Exercises 09-11 | Master state |
| Week 3 Labs | Exercises 12-14 | AWS patterns |
| Week 4 Labs | Exercises 15-17 | Module skills |

**Recommended workflow:**
1. Complete the main course lab
2. Practice related gym exercises to reinforce concepts
3. Return to gym exercises before exams for review

## Repository Structure

```
terraform-gym/
├── README.md                    # This file
├── CONTRIBUTING.md              # How to add exercises
├── exercises/
│   ├── exercise-01-basic-s3/
│   ├── exercise-02-s3-versioning/
│   ├── exercise-03-remote-state/
│   └── ...
├── common/
│   ├── validators/              # Shared validation scripts
│   └── templates/               # Exercise templates
└── solutions/                   # Reference solutions (separate branch)
```

## Adding New Exercises

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on creating new exercises.

## Support

- **Main Course Support**: See [terraform-course](https://github.com/shart-cloud/labs_terraform_course)
- **Gym-Specific Issues**: Open an issue in this repository
- **Discussions**: Use GitHub Discussions for questions

## License

Same as the main Terraform course.

## Credits

Created as a companion to the [Shart Cloud Terraform Course](https://github.com/shart-cloud/labs_terraform_course) by Jared Gore (@shart-cloud).
