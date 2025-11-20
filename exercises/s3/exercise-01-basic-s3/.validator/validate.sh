#!/bin/bash
# Validator for Exercise 01: Basic S3 Bucket

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track score
TOTAL_POINTS=100
EARNED_POINTS=0

# Solution directory (passed as argument or default to my-solution)
SOLUTION_DIR="${1:-my-solution}"

if [ ! -d "$SOLUTION_DIR" ]; then
    echo -e "${RED}❌ Solution directory not found: $SOLUTION_DIR${NC}"
    echo "Usage: $0 [solution-directory]"
    exit 1
fi

cd "$SOLUTION_DIR"

echo "========================================="
echo "Exercise 01: Basic S3 Bucket Validator"
echo "========================================="
echo ""

# Test 1: Check if Terraform is installed (0 points, just a check)
echo -n "Checking Terraform installation... "
if ! command -v terraform &> /dev/null; then
    echo -e "${RED}❌ Terraform not found${NC}"
    exit 1
fi
TERRAFORM_VERSION=$(terraform version -json | jq -r '.terraform_version')
echo -e "${GREEN}✅ Terraform $TERRAFORM_VERSION${NC}"

# Test 2: Terraform formatting (10 points)
echo -n "Checking Terraform formatting... "
if terraform fmt -check -recursive > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Code is properly formatted${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 10))
else
    echo -e "${YELLOW}⚠️  Code needs formatting (run: terraform fmt)${NC}"
fi

# Test 3: Terraform validation (15 points)
echo -n "Validating Terraform configuration... "
terraform init -backend=false > /dev/null 2>&1
if terraform validate > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Configuration is valid${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 15))
else
    echo -e "${RED}❌ Configuration has errors${NC}"
    terraform validate
    exit 1
fi

# Test 4: Check for required blocks in main.tf (20 points)
echo -n "Checking for terraform block... "
if grep -q "terraform {" main.tf; then
    echo -e "${GREEN}✅ Terraform block found${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 5))
else
    echo -e "${RED}❌ Terraform block missing${NC}"
fi

echo -n "Checking for provider block... "
if grep -q 'provider "aws"' main.tf; then
    echo -e "${GREEN}✅ AWS provider block found${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 5))
else
    echo -e "${RED}❌ AWS provider block missing${NC}"
fi

echo -n "Checking for S3 bucket resource... "
if grep -q 'resource "aws_s3_bucket"' main.tf; then
    echo -e "${GREEN}✅ S3 bucket resource found${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 10))
else
    echo -e "${RED}❌ S3 bucket resource missing${NC}"
fi

# Test 5: Check for required tags (25 points)
echo -n "Checking for required tags... "
REQUIRED_TAGS=("Name" "Environment" "ManagedBy" "Student" "AutoTeardown")
MISSING_TAGS=()

for tag in "${REQUIRED_TAGS[@]}"; do
    if ! grep -q "$tag" main.tf; then
        MISSING_TAGS+=("$tag")
    fi
done

if [ ${#MISSING_TAGS[@]} -eq 0 ]; then
    echo -e "${GREEN}✅ All required tags present${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 25))
else
    echo -e "${YELLOW}⚠️  Missing tags: ${MISSING_TAGS[*]}${NC}"
    EARNED_POINTS=$((EARNED_POINTS + $((25 - ${#MISSING_TAGS[@]} * 5))))
fi

# Test 6: Check version constraints (15 points)
echo -n "Checking Terraform version constraint... "
if grep -q 'required_version.*>=.*1.9' main.tf; then
    echo -e "${GREEN}✅ Correct version constraint${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 10))
else
    echo -e "${YELLOW}⚠️  Should require Terraform >= 1.9.0${NC}"
fi

echo -n "Checking AWS provider version... "
if grep -q 'version.*~>.*5' main.tf; then
    echo -e "${GREEN}✅ Correct provider version${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 5))
else
    echo -e "${YELLOW}⚠️  Should use AWS provider ~> 5.0${NC}"
fi

# Test 7: Check bucket naming (10 points)
echo -n "Checking bucket naming pattern... "
if grep -q 'terraform-gym-01' main.tf; then
    echo -e "${GREEN}✅ Correct bucket naming pattern${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 10))
else
    echo -e "${YELLOW}⚠️  Bucket name should include 'terraform-gym-01'${NC}"
fi

# Test 8: Bonus - Check if using variables (5 points)
echo -n "Checking for variable usage... "
if grep -q 'var.student_name' main.tf; then
    echo -e "${GREEN}✅ Using variables${NC}"
    EARNED_POINTS=$((EARNED_POINTS + 5))
else
    echo -e "${YELLOW}⚠️  Consider using var.student_name${NC}"
fi

# Final score
echo ""
echo "========================================="
echo -e "Score: ${EARNED_POINTS}/${TOTAL_POINTS}"

if [ $EARNED_POINTS -eq $TOTAL_POINTS ]; then
    echo -e "${GREEN}🎉 Perfect! You've mastered this exercise!${NC}"
elif [ $EARNED_POINTS -ge 90 ]; then
    echo -e "${GREEN}✅ Great job! Minor improvements possible.${NC}"
elif [ $EARNED_POINTS -ge 70 ]; then
    echo -e "${YELLOW}⚠️  Good effort. Review the feedback above.${NC}"
else
    echo -e "${RED}❌ Needs work. Check the hints in README.md${NC}"
fi
echo "========================================="

exit 0
