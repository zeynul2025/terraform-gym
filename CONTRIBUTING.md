# Contributing to Terraform Gym

Thank you for your interest in adding exercises to the Terraform Gym! This guide will help you create high-quality, consistent exercises.

## Exercise Design Principles

1. **Single Focus**: Each exercise should teach ONE specific concept or pattern
2. **Time-Boxed**: Target 15-30 minutes for completion
3. **Progressive**: Build on previous exercises when appropriate
4. **Cost-Conscious**: Keep AWS costs minimal (ideally $0.00-$0.05)
5. **Validated**: Include automated validation scripts
6. **Practical**: Focus on real-world patterns students will use

## Exercise Template Structure

Each exercise follows this directory structure:

```
exercises/exercise-XX-topic-name/
├── README.md                    # Exercise instructions
├── skeleton/                    # Starting point for students
│   ├── main.tf                 # Partial code with TODOs
│   ├── variables.tf            # Pre-defined variables
│   ├── outputs.tf              # (if needed) Output definitions
│   └── .gitignore              # Standard Terraform .gitignore
├── solution/                    # Reference solution
│   ├── main.tf                 # Complete, working code
│   ├── variables.tf
│   └── outputs.tf
└── .validator/                  # Automated testing
    └── validate.sh             # Validation script
```

## Creating a New Exercise

### Step 1: Plan Your Exercise

Before writing code, define:

- **Number**: What's the next available exercise number?
- **Topic**: What specific concept will this teach?
- **Prerequisites**: What should students know before attempting this?
- **Time**: Realistic completion time (15-30 min)
- **Cost**: Estimated AWS cost
- **Learning Outcomes**: What will students be able to do after completing this?

### Step 2: Create Directory Structure

```bash
# Replace XX with your exercise number and topic-name with a short descriptor
cd exercises/
mkdir -p exercise-XX-topic-name/{skeleton,solution,.validator}
```

### Step 3: Write the README

Use this template for `README.md`:

```markdown
# Exercise XX: Topic Name

**Time**: X minutes
**Difficulty**: Beginner/Intermediate/Advanced
**Cost**: $X.XX (free tier eligible)

## Objective

Clear, single-sentence description of what students will build.

## Prerequisites

- List required knowledge
- Previous exercises that should be completed first
- Any special tool requirements

## What You'll Practice

- Specific skill 1
- Specific skill 2
- Specific skill 3

## Starting Point

Description of what's provided in skeleton/ directory.

## Instructions

1. Step-by-step instructions
2. Be explicit about what to do
3. Include verification steps
4. Include cleanup steps

## Success Criteria

Checklist of requirements:
- ✅ Criterion 1
- ✅ Criterion 2
- ✅ Criterion 3

## Expected Cost

- **Resource 1**: $X.XX
- **Resource 2**: $X.XX
- **Total**: ~$X.XX/month

## Hints

<details>
<summary>Hint 1: Topic</summary>

Progressive hints that reveal more information.
</details>

## Learning Outcomes

After completing this exercise, you should be able to:
- ✅ Outcome 1
- ✅ Outcome 2

## Common Mistakes

❌ Mistake 1 and how to fix it
❌ Mistake 2 and how to fix it

## Next Steps

- Suggested next exercise
- Challenge extensions
- Related topics to explore

## Time Breakdown

- Task 1: X min
- Task 2: X min
- **Total**: ~XX minutes

## Related Course Material

- Link to relevant sections in main course
```

### Step 4: Create Skeleton Files

**Guidelines for skeleton files:**

1. **Include working boilerplate** (terraform block, provider block)
2. **Add helpful TODOs** where students need to write code
3. **Use comments** to guide students
4. **Provide structure** (e.g., show resource block outline)
5. **Include .gitignore** (use standard template)

**Example skeleton/main.tf:**

```hcl
# Exercise XX: Topic Name
# Complete the TODOs below

terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# TODO: Create a resource
# - Resource type: aws_xxx
# - Name: descriptive_name
# - Key parameters: param1, param2

# resource "aws_xxx" "descriptive_name" {
#   # Add configuration here
# }
```

**Standard .gitignore:**

```
# Terraform files
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
.terraform.lock.hcl

# Sensitive files
terraform.rc
.terraformrc
```

### Step 5: Create Solution Files

**Guidelines for solution files:**

1. **Complete, working code** that passes all validators
2. **Well-commented** to explain non-obvious choices
3. **Follow best practices** (formatting, naming, structure)
4. **Include all required tags**
5. **Match the skeleton structure**

**Example solution/main.tf:**

```hcl
# Exercise XX: Topic Name - Solution

terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_xxx" "descriptive_name" {
  # Complete working configuration

  tags = {
    Name         = "Exercise XX Resource"
    Environment  = "Learning"
    ManagedBy    = "Terraform"
    Student      = var.student_name
    AutoTeardown = "1h"
  }
}
```

### Step 6: Create Validator Script

**Guidelines for validators:**

1. **Check formatting** (`terraform fmt -check`)
2. **Validate syntax** (`terraform validate`)
3. **Check for required blocks/resources**
4. **Verify tags are present**
5. **Check version constraints**
6. **Provide clear, colorful output**
7. **Calculate a score** (0-100)

**Template .validator/validate.sh:**

```bash
#!/bin/bash
# Validator for Exercise XX: Topic Name

set -e

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

TOTAL_POINTS=100
EARNED_POINTS=0

SOLUTION_DIR="${1:-my-solution}"

if [ ! -d "$SOLUTION_DIR" ]; then
    echo -e "${RED}❌ Solution directory not found: $SOLUTION_DIR${NC}"
    exit 1
fi

cd "$SOLUTION_DIR"

echo "========================================="
echo "Exercise XX: Topic Name Validator"
echo "========================================="
echo ""

# Test 1: Terraform formatting (10 points)
echo -n "Checking Terraform formatting... "
if terraform fmt -check -recursive > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Code is properly formatted${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 10))
else
    echo -e "${YELLOW}⚠️  Code needs formatting${NC}"
fi

# Test 2: Terraform validation (15 points)
echo -n "Validating configuration... "
terraform init -backend=false > /dev/null 2>&1
if terraform validate > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Valid configuration${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 15))
else
    echo -e "${RED}❌ Invalid configuration${NC}"
    exit 1
fi

# Add more tests specific to your exercise...

# Final score
echo ""
echo "========================================="
echo -e "Score: ${EARNED_POINTS}/${TOTAL_POINTS}"

if [ $EARNED_POINTS -eq $TOTAL_POINTS ]; then
    echo -e "${GREEN}🎉 Perfect!${NC}"
elif [ $EARNED_POINTS -ge 90 ]; then
    echo -e "${GREEN}✅ Great job!${NC}"
elif [ $EARNED_POINTS -ge 70 ]; then
    echo -e "${YELLOW}⚠️  Good effort!${NC}"
else
    echo -e "${RED}❌ Needs work${NC}"
fi
echo "========================================="
```

Don't forget to make it executable:
```bash
chmod +x exercises/exercise-XX-topic-name/.validator/validate.sh
```

### Step 7: Test Your Exercise

Before submitting:

1. **Complete your own skeleton** - Pretend you're a student
2. **Time yourself** - Does it fit in 15-30 minutes?
3. **Run the validator** - Does it pass?
4. **Deploy to AWS** - Does it actually work?
5. **Check the cost** - Is it minimal?
6. **Clean up** - Does `terraform destroy` work?

### Step 8: Update Documentation

Add your exercise to:

1. **README.md** - Add to the exercise progression table
2. **exercises/INDEX.md** - Add to the master exercise list

## Exercise Numbering

- **01-10**: Foundation exercises (basic Terraform syntax, simple resources)
- **11-15**: State management exercises
- **16-25**: Resource patterns (S3, IAM, VPC basics)
- **26-35**: Advanced patterns (modules, dynamic blocks, loops)
- **36-40**: Cost optimization
- **41-50**: Security patterns
- **51-60**: Multi-resource scenarios
- **61-70**: Advanced topics (workspaces, complex modules)

## Exercise Difficulty Guidelines

**Beginner** (01-20):
- Single resource or 2-3 simple resources
- Clear, direct instructions
- Lots of hints
- Course Lab 0-2 equivalent

**Intermediate** (21-50):
- Multiple resources with dependencies
- Some problem-solving required
- Moderate hints
- Course Lab 3-5 equivalent

**Advanced** (51-70):
- Complex scenarios
- Minimal hints
- Students must research solutions
- Course Lab 6+ equivalent

## Cost Guidelines

All exercises should minimize AWS costs:

- **Free Tier Resources**: S3, CloudWatch Logs, IAM
- **Minimal Duration**: Deploy, validate, destroy within 30 min
- **Small Resources**: t2.micro/t3.micro only, minimal storage
- **AutoTeardown Tag**: Always include `AutoTeardown = "1h"`
- **Cost Estimate**: Clearly state in README

**Maximum acceptable cost per exercise**: $0.10

## Quality Checklist

Before submitting a new exercise:

- ✅ README is complete and follows template
- ✅ Skeleton has helpful TODOs
- ✅ Solution is tested and works
- ✅ Validator script is comprehensive
- ✅ All files are properly formatted (`terraform fmt`)
- ✅ Exercise takes 15-30 minutes
- ✅ Cost is minimal (< $0.10)
- ✅ Learning outcomes are clear
- ✅ Hints are progressive
- ✅ Common mistakes are documented
- ✅ Updated README.md and INDEX.md

## Submitting Your Exercise

1. **Fork the repository**
2. **Create a branch**: `git checkout -b exercise-XX-topic-name`
3. **Create your exercise** following all guidelines above
4. **Test thoroughly**
5. **Commit your changes**: `git commit -m "Add Exercise XX: Topic Name"`
6. **Push**: `git push origin exercise-XX-topic-name`
7. **Open a Pull Request** with:
   - Clear description of what the exercise teaches
   - Confirmation that you tested it
   - Screenshots of validator passing (optional)

## Questions?

Open an issue with the `question` label or start a discussion.

## Thank You!

Your contributions help students learn Terraform more effectively. We appreciate your effort in creating high-quality exercises!
