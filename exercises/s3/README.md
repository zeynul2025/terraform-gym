# S3 Exercise Series

Complete guide to mastering AWS S3 configuration with Terraform.

## 📚 Series Overview

This series teaches you everything you need to know about configuring AWS S3 buckets using Terraform, from basic creation to production-ready configurations with advanced features.

**Total Time**: ~105 minutes (exercises) + 60 minutes (challenge)
**Difficulty Progression**: Beginner → Intermediate → Challenge
**Cost**: $0.00 (all exercises are free tier eligible)

## 🎯 Learning Path

### Exercise 01: Basic S3 Bucket ⭐
**Time**: 15 minutes | **Difficulty**: Beginner

Create your first S3 bucket with proper configuration blocks and required tags.

**You'll learn**:
- Terraform and provider blocks
- Basic S3 bucket resource
- Required tagging
- Terraform workflow (init, plan, apply, destroy)

**Path**: `exercise-01-basic-s3/`

---

### Exercise 02: Versioning & Encryption ⭐
**Time**: 20 minutes | **Difficulty**: Beginner

Extend a basic bucket with versioning and server-side encryption.

**You'll learn**:
- Resource references and dependencies
- Nested configuration blocks
- S3 versioning configuration
- S3 encryption with AES256
- Defining useful outputs

**Path**: `exercise-02-versioning-encryption/`

---

### Exercise 03: Bucket Policies ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Add a bucket policy to control access and implement public access blocking.

**You'll learn**:
- Creating S3 bucket policies
- Using `jsonencode()` for JSON in HCL
- IAM policy structure
- Public access blocking
- Using data sources (`aws_caller_identity`)

**Path**: `exercise-03-bucket-policies/`

---

### Exercise 04: Lifecycle Rules ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Configure lifecycle rules for automatic storage class transitions and version expiration.

**You'll learn**:
- S3 lifecycle configuration
- Storage class transitions
- Version expiration policies
- Cost optimization strategies
- Multipart upload abortion

**Path**: `exercise-04-lifecycle-rules/`

---

### Challenge: Production-Ready S3 Bucket ⭐⭐⭐
**Time**: 45-60 minutes | **Difficulty**: Challenge

**🚨 NO SKELETON CODE PROVIDED!**

Build a complete production-ready S3 bucket from scratch using only Terraform documentation.

**Requirements**:
- All features from exercises 01-04
- PLUS: Access logging (new!)
- PLUS: Object lock configuration (new!)
- Total: 9 resources to configure

**Path**: `challenge-complete-s3/`

---

## 🗺️ Quick Navigation

| Exercise | Time | Difficulty | Status |
|----------|------|------------|--------|
| [01: Basic S3](exercise-01-basic-s3/) | 15 min | ⭐ Beginner | ✅ Ready |
| [02: Versioning & Encryption](exercise-02-versioning-encryption/) | 20 min | ⭐ Beginner | ✅ Ready |
| [03: Bucket Policies](exercise-03-bucket-policies/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [04: Lifecycle Rules](exercise-04-lifecycle-rules/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [Challenge: Complete S3](challenge-complete-s3/) | 60 min | ⭐⭐⭐ Challenge | ✅ Ready |

## 📖 What You'll Master

By completing this series, you'll be able to:

### Core S3 Skills
- ✅ Create and configure S3 buckets
- ✅ Enable versioning and encryption
- ✅ Write bucket policies with proper permissions
- ✅ Implement public access blocking
- ✅ Configure lifecycle rules for cost optimization
- ✅ Set up access logging
- ✅ Enable object lock for compliance

### Terraform Skills
- ✅ Use resource references and dependencies
- ✅ Work with nested configuration blocks
- ✅ Use `jsonencode()` for policies
- ✅ Leverage data sources for dynamic values
- ✅ Create useful outputs
- ✅ Read and implement from documentation

### AWS Best Practices
- ✅ Security: Encryption, public access blocking, policies
- ✅ Cost Optimization: Lifecycle transitions
- ✅ Compliance: Versioning, object lock
- ✅ Operations: Logging, tagging
- ✅ Production Readiness: All features combined

## 🎓 Recommended Approach

### For Beginners
Complete exercises in order:
```
01 → 02 → 03 → 04 → Challenge
```

**Why**: Each exercise builds on previous knowledge. The progression is carefully designed.

### For Experienced Users
Skip to intermediate exercises:
```
03 → 04 → Challenge
```

**Why**: If you already know basic S3, jump to policies and lifecycle rules.

### For Review/Practice
Do the challenge first:
```
Challenge → Review exercises as needed
```

**Why**: The challenge tests all skills. Review specific exercises if you get stuck.

## 💰 Cost Information

All exercises in this series are **FREE**:
- Empty S3 buckets: $0.00
- Bucket configurations: $0.00
- Lifecycle rules: $0.00 (only charged when rules execute)
- Bucket policies: $0.00
- Access logging: $0.00 for configuration (minimal cost if logs are generated)

**Total series cost**: < $0.01

## ⏱️ Time Commitment

| Approach | Time Required |
|----------|---------------|
| Complete Series (first time) | ~3 hours |
| Exercises Only | ~1.75 hours |
| Challenge Only | ~1 hour |
| Review/Repeat | ~1 hour |

## 🔗 Related Course Material

This series complements:
- **Course Lab 0**: Environment setup and basic S3
- **Course Lab 2**: S3 backend for remote state
- **Course Module**: Cost optimization

## 📊 Skills Matrix

| Skill | Ex 01 | Ex 02 | Ex 03 | Ex 04 | Challenge |
|-------|-------|-------|-------|-------|-----------|
| Basic bucket creation | ✅ | ✅ | ✅ | ✅ | ✅ |
| Versioning | | ✅ | | ✅ | ✅ |
| Encryption | | ✅ | | | ✅ |
| Public access block | | | ✅ | | ✅ |
| Bucket policies | | | ✅ | | ✅ |
| Lifecycle rules | | | | ✅ | ✅ |
| Access logging | | | | | ✅ |
| Object lock | | | | | ✅ |
| Research skills | | | | | ✅ |

## 🎯 Success Metrics

Track your progress:

- [ ] Completed Exercise 01 (Basic S3)
- [ ] Completed Exercise 02 (Versioning & Encryption)
- [ ] Completed Exercise 03 (Bucket Policies)
- [ ] Completed Exercise 04 (Lifecycle Rules)
- [ ] Attempted Challenge (45+ minutes of effort)
- [ ] Completed Challenge (90+ score)
- [ ] Can build production S3 bucket from memory
- [ ] Understand all S3 best practices

## 🚀 After This Series

Once you've mastered S3:

### Next Topics
- **IAM Series**: User management and permissions
- **VPC Series**: Network configuration
- **State Management**: Advanced Terraform state
- **EC2 Series**: Compute resources

### Advanced S3 Topics (Not in Gym)
- S3 Replication (cross-region, same-region)
- S3 Bucket Inventory
- S3 Analytics
- S3 Batch Operations
- S3 Event Notifications
- S3 Static Website Hosting

### Real-World Projects
- Build a static website hosting bucket
- Create a data lake storage system
- Implement disaster recovery with replication
- Set up centralized logging infrastructure

## 💡 Pro Tips

1. **Do exercises in one sitting** - Better for learning retention
2. **Repeat the challenge** - Try again after a week
3. **Time yourself** - Track improvement between attempts
4. **Experiment** - Try variations after completing exercises
5. **Take notes** - Document what you learn
6. **Teach others** - Best way to reinforce knowledge

## 🆘 Getting Help

- **Stuck on exercise**: Check hints in README
- **Validation failing**: Read error messages carefully
- **Need concepts**: Review AWS S3 documentation
- **Still stuck**: Check solution after 20+ minutes

## 📝 Series Maintainer

This series is maintained as part of the Terraform Gym project.

- Report issues with exercises
- Suggest improvements
- Contribute additional exercises

---

**Ready to start?** Begin with [Exercise 01: Basic S3](exercise-01-basic-s3/)!

**Feeling confident?** Jump to the [Challenge](challenge-complete-s3/)!
