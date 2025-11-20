# IAM Exercise Series

Complete guide to mastering AWS IAM (Identity and Access Management) configuration with Terraform.

## 📚 Series Overview

This series teaches you how to create and manage AWS IAM resources using Terraform, from basic user creation to complex role-based access control (RBAC) configurations.

**Total Time**: ~80 minutes (exercises) + 60 minutes (challenge)
**Difficulty Progression**: Beginner → Intermediate → Challenge
**Cost**: $0.00 (IAM resources are completely free)

## 🎯 Learning Path

### Exercise 01: Basic IAM User ⭐
**Time**: 20 minutes | **Difficulty**: Beginner

Create an IAM user with programmatic access and attach a managed policy.

**You'll learn**:
- Creating IAM users
- Generating access keys (and understanding the risks)
- Attaching AWS managed policies
- Handling sensitive outputs

**Path**: `exercise-01-basic-user/`

---

### Exercise 02: IAM Roles and Policies ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Create IAM roles with custom policies and trust relationships.

**You'll learn**:
- Creating IAM roles
- Defining assume role policies
- Creating custom inline policies
- Trust relationships and service principals

**Path**: `exercise-02-roles-policies/`

---

### Exercise 03: IAM Groups ⭐⭐
**Time**: 20 minutes | **Difficulty**: Intermediate

Organize users with groups and policy attachments.

**You'll learn**:
- Creating IAM groups
- Group policy attachments
- Adding users to groups
- Multi-user management patterns

**Path**: `exercise-03-groups/`

---

### Challenge: Complete IAM Setup ⭐⭐⭐
**Time**: 60 minutes | **Difficulty**: Challenge

**🚨 NO SKELETON CODE PROVIDED!**

Build a complete IAM structure for a multi-tier application using only Terraform documentation.

**Requirements**:
- Multiple users with different permission levels
- Service roles for EC2 and Lambda
- Custom policy documents
- Group-based access control
- PLUS: Password policy (new!)
- PLUS: Account alias (new!)

**Path**: `challenge-complete-iam/`

---

## 🗺️ Quick Navigation

| Exercise | Time | Difficulty | Status |
|----------|------|------------|--------|
| [01: Basic IAM User](exercise-01-basic-user/) | 20 min | ⭐ Beginner | ✅ Ready |
| [02: Roles & Policies](exercise-02-roles-policies/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [03: IAM Groups](exercise-03-groups/) | 20 min | ⭐⭐ Intermediate | ✅ Ready |
| [Challenge: Complete IAM](challenge-complete-iam/) | 60 min | ⭐⭐⭐ Challenge | ✅ Ready |

## 📖 What You'll Master

By completing this series, you'll be able to:

### Core IAM Skills
- ✅ Create and manage IAM users
- ✅ Generate and secure access keys
- ✅ Create IAM roles with trust policies
- ✅ Write custom IAM policy documents
- ✅ Organize users with groups
- ✅ Attach managed and inline policies
- ✅ Configure account-level security settings

### Terraform Skills
- ✅ Handle sensitive outputs
- ✅ Create complex policy documents with `jsonencode()`
- ✅ Use data sources for AWS managed policies
- ✅ Manage resource dependencies
- ✅ Work with lists and for_each

### Security Best Practices
- ✅ Principle of least privilege
- ✅ Role-based access control (RBAC)
- ✅ Service roles for AWS resources
- ✅ Secure credential management
- ✅ Password policies and MFA enforcement
- ✅ Access key rotation strategies

## 🎓 Recommended Approach

### For Beginners
Complete exercises in order:
```
01 → 02 → 03 → Challenge
```

### For Experienced Users
Skip to roles and challenge:
```
02 → 03 → Challenge
```

### For Review
Do challenge first, review as needed:
```
Challenge → Review specific exercises
```

## 💰 Cost Information

**ALL IAM resources are FREE**:
- IAM Users: $0.00
- IAM Roles: $0.00
- IAM Groups: $0.00
- IAM Policies: $0.00
- Access Keys: $0.00

**Total series cost**: $0.00

## ⚠️ Important Security Notes

**Access Keys**:
- Never commit access keys to version control
- Rotate keys regularly (90 days recommended)
- Delete unused keys immediately
- Use roles instead of keys when possible

**Exercises use access keys for learning purposes only**. In production:
- Prefer IAM roles over access keys
- Use temporary credentials (STS)
- Enable MFA for sensitive operations
- Implement least privilege access

## 📊 Skills Matrix

| Skill | Ex 01 | Ex 02 | Ex 03 | Challenge |
|-------|-------|-------|-------|-----------|
| IAM Users | ✅ | ✅ | ✅ | ✅ |
| Access Keys | ✅ | | | ✅ |
| Managed Policies | ✅ | | ✅ | ✅ |
| IAM Roles | | ✅ | | ✅ |
| Custom Policies | | ✅ | | ✅ |
| Trust Policies | | ✅ | | ✅ |
| IAM Groups | | | ✅ | ✅ |
| Password Policy | | | | ✅ |
| Account Alias | | | | ✅ |

## 🔗 Related Course Material

This series complements:
- **Course**: Security and access management
- **Best Practices**: Least privilege access
- **Production**: Service roles for applications

## 🚀 After This Series

### Next Topics
- **VPC Series**: Network isolation and security
- **EC2 Series**: Instance profiles and IAM roles
- **S3 Series**: Bucket policies and access control

### Advanced IAM Topics (Not in Gym)
- IAM Identity Center (SSO)
- Cross-account access
- IAM Access Analyzer
- Permission boundaries
- Service control policies (SCPs)
- SAML federation

### Real-World Projects
- Multi-account AWS organization
- CI/CD pipeline IAM roles
- Developer access tiers
- Production deployment roles

## 💡 Pro Tips

1. **Use roles, not users** - For applications and services
2. **Enable MFA** - For human users, especially admins
3. **Audit regularly** - Review unused credentials
4. **Least privilege** - Start restrictive, expand as needed
5. **Use managed policies** - When they fit your needs
6. **Document permissions** - Why each policy exists

## 🆘 Getting Help

- **Policy errors**: Use IAM Policy Simulator
- **Permission issues**: Check CloudTrail logs
- **Syntax errors**: Validate JSON with online tools
- **Still stuck**: Check AWS IAM documentation

---

**Ready to start?** Begin with [Exercise 01: Basic IAM User](exercise-01-basic-user/)!

**Feeling confident?** Jump to the [Challenge](challenge-complete-iam/)!
