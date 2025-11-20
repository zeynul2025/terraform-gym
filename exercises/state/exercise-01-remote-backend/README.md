# Exercise 01: Remote State Backend

**Time**: 25 minutes | **Difficulty**: Beginner | **Cost**: $0.00

## Objective

Configure S3 backend for remote state storage and migrate from local state. Learn Terraform 1.9+ native S3 locking.

## What You'll Practice

- Creating S3 bucket for state storage
- Configuring S3 backend
- Migrating from local to remote state
- Using native S3 locking (no DynamoDB needed!)
- Backend configuration best practices

## Instructions

1. Create infrastructure with local state first
2. Create S3 bucket for state storage
3. Configure backend block for S3
4. Migrate state from local to remote
5. Verify state in S3
6. Test operations work with remote state

## Success Criteria

- ✅ S3 bucket created for state
- ✅ Backend configured with encryption
- ✅ State migrated successfully
- ✅ Operations work with remote state
- ✅ Local state files removed

## Key Concepts

**Remote State Benefits**:
- Team collaboration (shared state)
- State locking (prevent conflicts)
- Versioning (S3 versioning)
- Encryption (at rest)
- No local state files

**Terraform 1.9+ Native S3 Locking**:
- Uses `use_lockfile = true`
- No DynamoDB table needed!
- Simpler setup
- Lower cost (free!)

## Related Docs

- [S3 Backend](https://developer.hashicorp.com/terraform/language/settings/backends/s3)
- [Backend Configuration](https://developer.hashicorp.com/terraform/language/settings/backends/configuration)
