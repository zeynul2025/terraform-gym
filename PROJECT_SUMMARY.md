# Terraform Gym - Project Summary

## Overview

The Terraform Gym is a companion project to the [Shart Cloud Terraform Course](https://github.com/shart-cloud/labs_terraform_course) that provides short, focused exercises (15-30 minutes each) for students to practice specific Terraform skills.

## Project Structure

```
terraform-gym/
├── README.md                           # Main introduction and concept
├── QUICK_START.md                      # 5-minute getting started guide
├── CONTRIBUTING.md                     # How to create new exercises
├── PROJECT_SUMMARY.md                  # This file
│
├── exercises/                          # All exercises
│   ├── INDEX.md                       # Complete exercise catalog
│   │
│   ├── exercise-01-basic-s3/          # Exercise 01: Basic S3 Bucket
│   │   ├── README.md                  # Instructions (15 min)
│   │   ├── skeleton/                  # Student starting point
│   │   │   ├── main.tf               # Partial code with TODOs
│   │   │   ├── variables.tf          # Pre-defined variables
│   │   │   └── .gitignore            # Standard Terraform .gitignore
│   │   ├── solution/                  # Reference solution
│   │   │   ├── main.tf               # Complete working code
│   │   │   └── variables.tf
│   │   └── .validator/                # Automated validation
│   │       └── validate.sh           # Scoring script
│   │
│   ├── exercise-02-s3-versioning/     # Exercise 02: S3 with versioning
│   │   ├── README.md                  # Instructions (20 min)
│   │   ├── skeleton/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   ├── outputs.tf            # Output definitions
│   │   │   └── .gitignore
│   │   ├── solution/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   └── .validator/
│   │       └── validate.sh
│   │
│   └── exercise-03-remote-state/      # Exercise 03: Remote state (planned)
│       └── [structure similar to above]
│
└── common/                             # Shared resources
    ├── validators/                     # Reusable validation functions
    │   └── common.sh                  # Common validation library
    └── templates/                      # Exercise templates (planned)
        ├── basic-exercise/
        ├── multi-resource-exercise/
        └── module-exercise/
```

## Completed Components

### Core Documentation ✅
- **README.md**: Main project introduction, concept, and usage guide
- **QUICK_START.md**: Fast-track getting started guide (5 min)
- **CONTRIBUTING.md**: Comprehensive guide for creating new exercises
- **PROJECT_SUMMARY.md**: This file - project overview

### Exercise Infrastructure ✅
- **exercises/INDEX.md**: Complete exercise catalog with:
  - Quick reference table
  - Detailed exercise descriptions
  - Learning paths (S3 Mastery, Terraform Fundamentals, etc.)
  - Filtering by difficulty, time, and topic
  - Roadmap for future exercises

### Common Libraries ✅
- **common/validators/common.sh**: Reusable validation functions including:
  - Terraform formatting checks
  - Configuration validation
  - Block existence checks
  - Tag validation
  - Pattern matching
  - Scoring and output formatting

### Exercise 01: Basic S3 Bucket ✅
**Status**: Complete and ready to use
**Time**: 15 minutes
**Difficulty**: Beginner

**Components**:
- ✅ README.md with detailed instructions
- ✅ Skeleton with helpful TODOs
- ✅ Complete solution
- ✅ Automated validator (100-point scoring system)

**What it teaches**:
- Terraform and provider blocks
- Basic S3 bucket creation
- Required tagging
- Terraform workflow (init, plan, apply, destroy)

### Exercise 02: S3 Versioning & Encryption ✅
**Status**: Complete and ready to use
**Time**: 20 minutes
**Difficulty**: Beginner

**Components**:
- ✅ README.md with detailed instructions
- ✅ Skeleton with helpful TODOs and partial implementation
- ✅ Complete solution
- ✅ Output definitions for exposing useful information

**What it teaches**:
- Resource references and dependencies
- Nested configuration blocks
- S3 versioning configuration
- S3 encryption configuration
- Defining outputs

### Exercise 03: Remote State Backend ⏳
**Status**: Planned (directory structure created)
**Time**: 25 minutes
**Difficulty**: Beginner

**Will teach**:
- S3 backend configuration
- State migration from local to remote
- State locking with S3
- Backend configuration best practices

## Design Philosophy

### Exercise Structure
Each exercise follows a consistent pattern:
1. **README.md**: Clear instructions with time estimate, objectives, and hints
2. **skeleton/**: Starting point with helpful TODOs and comments
3. **solution/**: Reference implementation (students shouldn't peek early)
4. **validator/**: Automated scoring and feedback

### Learning Approach
- **Focused**: One concept per exercise
- **Progressive**: Build on previous knowledge
- **Hands-on**: Learn by doing, not reading
- **Low-stakes**: Practice without affecting course grades
- **Validated**: Immediate feedback via automated validators

### Cost-Conscious
All exercises designed to be:
- Free tier eligible where possible
- Completed and destroyed within 30 minutes
- Tagged with AutoTeardown for safety
- Estimated cost < $0.10 per exercise

## Integration with Main Course

The gym complements the main course:

| Main Course Lab | Duration | Gym Exercises | Duration |
|-----------------|----------|---------------|----------|
| Lab 0 (Setup) | 3.5-4.5 hr | Exercises 01-05 | ~90 min |
| Lab 1 | ~3 hr | Exercises 06-10 | ~2 hr |
| Lab 2 | ~3 hr | Exercises 11-15 | ~2 hr |

**Use cases**:
- **During class**: Quick exercises during breaks
- **Homework**: Reinforce lab concepts
- **Review**: Before exams, redo key exercises
- **Practice**: Build muscle memory for patterns

## Exercise Progression

### Foundation (01-10) - Beginner
Focus on basic Terraform syntax and simple resources:
- ✅ 01: Basic S3 Bucket
- ✅ 02: S3 Versioning & Encryption
- ⏳ 03: Remote State Backend
- 📋 04: Variables Deep Dive
- 📋 05: Output Expressions
- 📋 06: Resource Dependencies

### State Management (11-15) - Intermediate
Practice state operations:
- 📋 11: State Commands (list, show, mv, rm)
- 📋 12: State Migration
- 📋 13: Importing Resources

### AWS Patterns (16-25) - Intermediate
Common AWS resource configurations:
- 📋 16: S3 Bucket Policies
- 📋 17: IAM Users and Policies
- 📋 18: EC2 Instances
- 📋 19: Security Groups

### Advanced (26-40) - Advanced
Complex patterns and modules:
- 📋 26: Your First Module
- 📋 27: Module Composition
- 📋 36: Dynamic Blocks
- 📋 37: Count and For Each

Legend: ✅ Complete | ⏳ In Progress | 📋 Planned

## Validation System

Each exercise includes an automated validator that:
- Checks Terraform formatting
- Validates configuration syntax
- Verifies required blocks and resources
- Checks for proper tagging
- Validates version constraints
- Scores out of 100 points
- Provides color-coded feedback

Example output:
```
=========================================
Exercise 01: Basic S3 Bucket Validator
=========================================

Checking Terraform formatting... ✅ Code is properly formatted
Validating configuration... ✅ Configuration is valid
Checking for terraform block... ✅ Terraform block found
Checking for provider block... ✅ AWS provider block found
Checking for S3 bucket resource... ✅ S3 bucket resource found
Checking for required tags... ✅ All required tags present

=========================================
Score: 100/100
🎉 Perfect! You've mastered this exercise!
=========================================
```

## Contributing

The project is designed to be community-extensible:
- **CONTRIBUTING.md** provides comprehensive guidelines
- **Common libraries** simplify validator creation
- **Templates** (planned) will provide starting points
- **Consistent structure** makes adding exercises straightforward

## Technical Requirements

### Student Requirements
- Terraform 1.9.0+
- AWS CLI configured
- Basic command line knowledge
- Text editor (VS Code recommended)

### Exercise Requirements
- Must complete in 15-30 minutes
- Cost < $0.10 (preferably $0.00)
- Include automated validation
- Follow standard structure
- Include progressive hints

## Next Steps

### Immediate (Priority 1)
1. Complete Exercise 03: Remote State Backend
2. Create Exercise 04: Variables Deep Dive
3. Create Exercise 05: Output Expressions

### Short-term (Priority 2)
4. Create exercise templates in common/templates/
5. Add Exercises 06-10 (complete Foundation section)
6. Create automated exercise testing framework

### Medium-term (Priority 3)
7. Add State Management exercises (11-15)
8. Add AWS Pattern exercises (16-25)
9. Create learning path tracker

### Long-term (Priority 4)
10. Build web interface for tracking progress
11. Add more advanced exercises (modules, dynamic blocks)
12. Create certification-style comprehensive exercises

## Success Metrics

The gym will be successful if students:
- Can complete exercises in target time (15-30 min)
- Score 90+ on validators after practice
- Report improved confidence with Terraform
- Use exercises for exam preparation
- Contribute new exercises back to the project

## Comparison: Labs vs Gym

| Aspect | Main Course Labs | Terraform Gym |
|--------|------------------|---------------|
| Duration | 3-5 hours | 15-30 minutes |
| Scope | Complete scenarios | Single concepts |
| Grading | Affects course grade | Practice only |
| Depth | Comprehensive | Focused |
| Repetition | Once | Multiple times |
| When | Weekly | Anytime |
| Purpose | Learn & demonstrate | Practice & reinforce |

Both are essential: Labs teach, Gym builds muscle memory.

## Maintenance Plan

### Regular Updates
- Add new exercises monthly
- Update existing exercises based on feedback
- Keep aligned with main course changes
- Update AWS provider versions as needed

### Quality Assurance
- Test all exercises before release
- Verify costs remain minimal
- Update documentation
- Respond to issues promptly

## Repository Links

- **Terraform Gym**: (this repository)
- **Main Course**: https://github.com/shart-cloud/labs_terraform_course
- **Issues**: Submit bugs or feature requests
- **Discussions**: Ask questions, share ideas

## Credits

Created as a companion to the Shart Cloud Terraform Course by Jared Gore (@shart-cloud).

Inspired by:
- Coding kata concept (programming exercises)
- LeetCode (focused practice problems)
- Terraform documentation examples
- Real-world AWS patterns

## License

Same as the main Terraform course.

---

**Project Status**: Alpha - Core infrastructure complete, 2 exercises ready, expanding
**Last Updated**: 2025-11-20
**Version**: 0.1.0
