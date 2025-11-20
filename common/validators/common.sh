#!/bin/bash
# Common validation functions for Terraform Gym exercises
# Source this file in your exercise validators

# Colors for output
export GREEN='\033[0;32m'
export RED='\033[0;31m'
export YELLOW='\033[1;33m'
export BLUE='\033[0;34m'
export NC='\033[0m' # No Color

# Validate Terraform is installed
check_terraform_installed() {
    if ! command -v terraform &> /dev/null; then
        echo -e "${RED}❌ Terraform not found. Please install Terraform 1.9.0+${NC}"
        exit 1
    fi
}

# Check Terraform version is >= required version
check_terraform_version() {
    local required_version="$1"
    local current_version=$(terraform version -json 2>/dev/null | jq -r '.terraform_version')

    if [ -z "$current_version" ]; then
        echo -e "${YELLOW}⚠️  Could not determine Terraform version${NC}"
        return 1
    fi

    # Simple version comparison (works for major.minor.patch)
    local required_major=$(echo "$required_version" | cut -d. -f1)
    local required_minor=$(echo "$required_version" | cut -d. -f2)
    local current_major=$(echo "$current_version" | cut -d. -f1)
    local current_minor=$(echo "$current_version" | cut -d. -f2)

    if [ "$current_major" -lt "$required_major" ] || \
       ([ "$current_major" -eq "$required_major" ] && [ "$current_minor" -lt "$required_minor" ]); then
        echo -e "${YELLOW}⚠️  Terraform $current_version found, but >= $required_version recommended${NC}"
        return 1
    fi

    return 0
}

# Test: Terraform formatting (returns points earned)
test_terraform_formatting() {
    local points="$1"
    local dir="${2:-.}"

    echo -n "Checking Terraform formatting... "

    cd "$dir"
    if terraform fmt -check -recursive > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Code is properly formatted${NC}"
        echo "$points"
        return 0
    else
        echo -e "${YELLOW}⚠️  Code needs formatting (run: terraform fmt)${NC}"
        echo "0"
        return 1
    fi
}

# Test: Terraform validation (returns points earned)
test_terraform_validation() {
    local points="$1"
    local dir="${2:-.}"

    echo -n "Validating Terraform configuration... "

    cd "$dir"
    terraform init -backend=false > /dev/null 2>&1

    if terraform validate > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Configuration is valid${NC}"
        echo "$points"
        return 0
    else
        echo -e "${RED}❌ Configuration has errors${NC}"
        terraform validate
        echo "0"
        return 1
    fi
}

# Check if a block type exists in file (returns points earned)
check_block_exists() {
    local block_type="$1"  # e.g., "terraform", "provider", "resource"
    local file="$2"
    local points="$3"
    local description="${4:-$block_type block}"

    echo -n "Checking for $description... "

    if grep -q "^[[:space:]]*$block_type[[:space:]]*{" "$file" || \
       grep -q "^[[:space:]]*$block_type[[:space:]]*\"" "$file"; then
        echo -e "${GREEN}✅ Found${NC}"
        echo "$points"
        return 0
    else
        echo -e "${RED}❌ Missing${NC}"
        echo "0"
        return 1
    fi
}

# Check if required tags are present (returns points earned)
check_required_tags() {
    local file="$1"
    local points="$2"
    local tag_names=("${@:3}")  # Remaining arguments are tag names

    echo -n "Checking for required tags... "

    local missing_tags=()
    local points_per_tag=$((points / ${#tag_names[@]}))
    local earned=0

    for tag in "${tag_names[@]}"; do
        if grep -q "$tag" "$file"; then
            ((earned += points_per_tag))
        else
            missing_tags+=("$tag")
        fi
    done

    if [ ${#missing_tags[@]} -eq 0 ]; then
        echo -e "${GREEN}✅ All tags present${NC}"
        echo "$points"
        return 0
    else
        echo -e "${YELLOW}⚠️  Missing tags: ${missing_tags[*]}${NC}"
        echo "$earned"
        return 1
    fi
}

# Check if a string pattern exists in file (returns points earned)
check_pattern_exists() {
    local pattern="$1"
    local file="$2"
    local points="$3"
    local description="$4"

    echo -n "Checking for $description... "

    if grep -q "$pattern" "$file"; then
        echo -e "${GREEN}✅ Found${NC}"
        echo "$points"
        return 0
    else
        echo -e "${YELLOW}⚠️  Not found${NC}"
        echo "0"
        return 1
    fi
}

# Print section header
print_section() {
    local title="$1"
    echo ""
    echo "========================================="
    echo "$title"
    echo "========================================="
    echo ""
}

# Print final score with color-coded message
print_final_score() {
    local earned="$1"
    local total="$2"

    echo ""
    echo "========================================="
    echo -e "Score: ${BLUE}${earned}/${total}${NC}"

    local percentage=$((earned * 100 / total))

    if [ $earned -eq $total ]; then
        echo -e "${GREEN}🎉 Perfect! You've mastered this exercise!${NC}"
    elif [ $percentage -ge 90 ]; then
        echo -e "${GREEN}✅ Excellent! Minor improvements possible.${NC}"
    elif [ $percentage -ge 80 ]; then
        echo -e "${GREEN}✅ Great job! A few things to polish.${NC}"
    elif [ $percentage -ge 70 ]; then
        echo -e "${YELLOW}⚠️  Good effort. Review the feedback above.${NC}"
    elif [ $percentage -ge 60 ]; then
        echo -e "${YELLOW}⚠️  Needs improvement. Check the hints in README.md${NC}"
    else
        echo -e "${RED}❌ Needs significant work. Review the exercise instructions.${NC}"
    fi

    echo "========================================="
}

# Check if solution directory exists
check_solution_dir() {
    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo -e "${RED}❌ Solution directory not found: $dir${NC}"
        echo "Usage: $0 [solution-directory]"
        return 1
    fi

    return 0
}

# Validate AWS CLI is installed and configured
check_aws_configured() {
    if ! command -v aws &> /dev/null; then
        echo -e "${YELLOW}⚠️  AWS CLI not found. Skipping AWS verification tests.${NC}"
        return 1
    fi

    if ! aws sts get-caller-identity &> /dev/null; then
        echo -e "${YELLOW}⚠️  AWS credentials not configured. Skipping AWS verification tests.${NC}"
        return 1
    fi

    return 0
}

# Count resources in plan (requires terraform init and valid config)
count_resources_in_plan() {
    local dir="${1:-.}"

    cd "$dir"

    # Run plan and capture output
    local plan_output=$(terraform plan -input=false 2>&1)

    # Extract resource count from plan output
    # Look for lines like "Plan: 3 to add, 0 to change, 0 to destroy"
    local count=$(echo "$plan_output" | grep -oP 'Plan: \K\d+(?= to add)' || echo "0")

    echo "$count"
}

# Export functions for use in validators
export -f check_terraform_installed
export -f check_terraform_version
export -f test_terraform_formatting
export -f test_terraform_validation
export -f check_block_exists
export -f check_required_tags
export -f check_pattern_exists
export -f print_section
export -f print_final_score
export -f check_solution_dir
export -f check_aws_configured
export -f count_resources_in_plan
