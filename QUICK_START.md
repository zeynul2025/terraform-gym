# Terraform Gym - Quick Start

Get started with Terraform Gym exercises in under 5 minutes!

## Prerequisites

You should have already completed:
- ✅ Main course setup (or have AWS CLI and Terraform installed)
- ✅ AWS credentials configured
- ✅ Basic understanding of Terraform syntax

If not, see the [main course QUICK_START](https://github.com/shart-cloud/labs_terraform_course/blob/main/QUICK_START.md).

## First Exercise (5 minutes)

Let's complete Exercise 01 to get familiar with the gym format:

### 1. Navigate to Exercise 01
```bash
cd terraform-gym/exercises/exercise-01-basic-s3/
```

### 2. Read the Instructions
```bash
cat README.md
# Or open in your editor: code README.md
```

### 3. Copy Skeleton to Your Workspace
```bash
cp -r skeleton/ my-solution/
cd my-solution/
```

### 4. Complete the TODOs
Open `main.tf` in your editor and fill in the TODOs:

```bash
# Edit the file
vim main.tf
# or
code main.tf
```

Look for lines with `TODO:` and complete them. Don't peek at the solution yet!

### 5. Update Your Student Name
Edit `variables.tf` and replace `REPLACE-WITH-YOUR-NAME` with your actual name/username.

### 6. Test Your Solution
```bash
# Initialize Terraform
terraform init

# Format your code
terraform fmt

# Validate syntax
terraform validate

# Preview what will be created
terraform plan
```

If everything looks good, deploy it:

```bash
terraform apply
# Type 'yes' when prompted
```

### 7. Verify It Works
```bash
# Check the bucket was created
aws s3 ls | grep terraform-gym-01

# View Terraform outputs
terraform output
```

### 8. Run the Validator
```bash
cd ..  # Back to exercise directory
./.validator/validate.sh my-solution
```

You should see your score and any feedback.

### 9. Clean Up
**IMPORTANT**: Always clean up to avoid AWS charges!

```bash
cd my-solution/
terraform destroy
# Type 'yes' when prompted
```

Verify the bucket is gone:
```bash
aws s3 ls | grep terraform-gym-01
# Should return nothing
```

## You Did It! 🎉

You just completed your first Terraform Gym exercise!

## What's Next?

### Option 1: Continue Learning Sequentially
```bash
cd ../exercise-02-s3-versioning/
cat README.md
```

### Option 2: Pick by Topic
See [exercises/INDEX.md](exercises/INDEX.md) for a complete list organized by topic.

### Option 3: Follow a Learning Path
The INDEX also includes curated learning paths like "S3 Mastery" or "Terraform Fundamentals."

## Gym Workflow Summary

Here's the pattern you'll follow for every exercise:

```
1. Read README.md
   ↓
2. Copy skeleton/ to my-solution/
   ↓
3. Complete the TODOs
   ↓
4. Test: init → fmt → validate → plan → apply
   ↓
5. Verify with AWS CLI or Console
   ↓
6. Run .validator/validate.sh
   ↓
7. Clean up: terraform destroy
```

## Tips for Success

### Do's ✅
- **Read the README first** - Don't skip the instructions
- **Try without hints** - Check hints only when stuck
- **Time yourself** - Track your improvement
- **Experiment** - Try variations after completing the exercise
- **Always clean up** - Run `terraform destroy` when done

### Don'ts ❌
- **Don't peek at solutions** until you've tried for 20+ minutes
- **Don't skip validation** - The validator teaches you too
- **Don't forget to destroy** - Avoid unexpected AWS charges
- **Don't commit state files** - The .gitignore is there for a reason

## Common Commands Reference

### Terraform Workflow
```bash
terraform init          # Initialize (downloads providers)
terraform fmt           # Format code
terraform validate      # Check syntax
terraform plan          # Preview changes
terraform apply         # Create/modify resources
terraform destroy       # Delete resources
terraform output        # Show outputs
```

### AWS Verification
```bash
# List S3 buckets
aws s3 ls

# Describe a bucket
aws s3api head-bucket --bucket BUCKET-NAME

# Check versioning
aws s3api get-bucket-versioning --bucket BUCKET-NAME

# Check encryption
aws s3api get-bucket-encryption --bucket BUCKET-NAME
```

### Validator
```bash
# Run validator on my-solution/
./.validator/validate.sh my-solution

# Run validator on custom directory
./.validator/validate.sh ../my-custom-solution/
```

## Troubleshooting

### "Error: Failed to download providers"
```bash
# Check internet connection
# Try reinitializing
rm -rf .terraform
terraform init
```

### "Error: BucketAlreadyExists"
- Someone else is using that bucket name
- Change your student_name in variables.tf
- Or manually change the bucket name in main.tf

### "Error: Access Denied"
```bash
# Verify AWS credentials
aws sts get-caller-identity

# Check S3 permissions
aws s3 ls
```

### "Validator says formatting is wrong"
```bash
# Auto-format all Terraform files
terraform fmt -recursive

# Check what would change
terraform fmt -check -recursive
```

### "Forgot to destroy resources"
```bash
# Go back to your solution directory
cd path/to/my-solution/

# Initialize (if needed)
terraform init

# Destroy
terraform destroy
```

### "Lost state file"
- If you only worked locally and didn't commit state to Git, you might need to manually delete resources from AWS Console
- This is why the main course teaches remote state!
- For gym exercises, just delete the S3 bucket manually if needed:
  ```bash
  aws s3 rb s3://terraform-gym-XX-yourname --force
  ```

## Exercise Difficulty Guide

- **Beginner (⭐)**: 15-20 min, single resource or simple pattern
- **Intermediate (⭐⭐)**: 20-30 min, multiple resources, some complexity
- **Advanced (⭐⭐⭐)**: 30+ min, complex scenarios, minimal hints

Start with beginner exercises and work your way up!

## Integration with Main Course

| After Completing... | Practice These Exercises |
|---------------------|--------------------------|
| Course Lab 0 | Exercises 01-05 |
| Course Lab 1 | Exercises 06-10 |
| Course Lab 2 | Exercises 11-15 |
| Course Lab 3 | Exercises 16-20 |

## Getting Help

- **Exercise unclear?** Open an issue with the exercise number
- **Validator confusing?** Check the exercise README.md hints
- **Still stuck?** Compare with solution/ (after 20+ min of trying!)
- **Found a bug?** Open a PR with a fix
- **Have an idea?** See [CONTRIBUTING.md](CONTRIBUTING.md)

## Cost Management

All exercises are designed to be nearly free:

- **Target cost**: $0.00 per exercise
- **Maximum cost**: < $0.05 per exercise
- **How**: Use free-tier resources, destroy immediately
- **Protection**: All resources tagged with `AutoTeardown = "1h"`

**Best practice**: Set up a billing alert for $5/month to catch any mistakes.

## Time Management

Exercises are designed for:
- **Quick practice**: During class breaks (15 min exercises)
- **Homework**: Deeper practice (20-30 min exercises)
- **Before exams**: Review fundamentals (do exercises 01-05 again)

**Pro tip**: Repeat exercises a week later to reinforce learning!

## Ready to Start?

Pick an exercise and get going:

```bash
cd exercises/exercise-01-basic-s3/
cat README.md
```

**Good luck and happy learning!** 🚀

---

**Questions?** Open an issue or discussion in the repository.

**Want to contribute?** See [CONTRIBUTING.md](CONTRIBUTING.md).
