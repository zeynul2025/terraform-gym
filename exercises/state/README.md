# State Management Exercise Series

Complete guide to mastering Terraform state management and "state surgery" - advanced state manipulation techniques.

## 📚 Series Overview

This series teaches you how to manage Terraform state files, from basic remote backends to complex state manipulation and recovery scenarios. Master the critical skill of "state surgery" - safely manipulating state files to recover from disasters.

**Total Time**: ~100 minutes (exercises) + 90 minutes (challenge)
**Difficulty Progression**: Beginner → Advanced → Expert
**Cost**: $0.00 (S3 state storage is minimal)

## 🎯 Learning Path

### Exercise 01: Remote State Backend ⭐
**Time**: 25 minutes | **Difficulty**: Beginner

Configure S3 backend for remote state storage with native locking.

**You'll learn**:
- Configuring S3 backend
- Migrating from local to remote state
- State locking with S3 native locking (Terraform 1.9+)
- Backend configuration best practices

**Path**: `exercise-01-remote-backend/`

---

### Exercise 02: State Commands ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Master essential state manipulation commands for everyday operations.

**You'll learn**:
- `terraform state list` - View resources
- `terraform state show` - Inspect resources
- `terraform state mv` - Rename/move resources
- `terraform state rm` - Remove from state
- When and why to use each command

**Path**: `exercise-02-state-commands/`

---

### Exercise 03: Importing Existing Resources ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Import existing AWS resources into Terraform management.

**You'll learn**:
- Using `terraform import`
- Writing configuration for existing resources
- Import blocks (Terraform 1.5+)
- Verifying imported resources

**Path**: `exercise-03-import-resources/`

---

### Exercise 04: State Locking & Troubleshooting ⭐⭐⭐
**Time**: 25 minutes | **Difficulty**: Advanced

Handle state locking issues and recover from common problems.

**You'll learn**:
- Understanding state locks
- Force-unlocking stuck states
- Preventing lock conflicts
- Recovery procedures

**Path**: `exercise-04-state-locking/`

---

### Challenge: State Surgery ⭐⭐⭐
**Time**: 90 minutes | **Difficulty**: Expert

**🚨 ADVANCED STATE MANIPULATION!**

Perform complex "state surgery" operations to recover from disasters and reorganize infrastructure.

**Scenarios**:
- Split monolithic state into modules
- Merge multiple state files
- Recover from accidentally deleted resources
- Move resources between workspaces
- Fix drift and inconsistencies
- PLUS: State backup and recovery (new!)
- PLUS: Remote state data sources (new!)

**Path**: `challenge-state-surgery/`

---

## 🗺️ Quick Navigation

| Exercise | Time | Difficulty | Status |
|----------|------|------------|--------|
| [01: Remote Backend](exercise-01-remote-backend/) | 25 min | ⭐ Beginner | ✅ Ready |
| [02: State Commands](exercise-02-state-commands/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [03: Import Resources](exercise-03-import-resources/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [04: State Locking](exercise-04-state-locking/) | 25 min | ⭐⭐⭐ Advanced | ✅ Ready |
| [Challenge: State Surgery](challenge-state-surgery/) | 90 min | ⭐⭐⭐ Expert | ✅ Ready |

## 📖 What You'll Master

### Core State Skills
- ✅ Configure remote state backends
- ✅ Migrate state between backends
- ✅ Inspect and manipulate state safely
- ✅ Import existing infrastructure
- ✅ Handle state locking issues
- ✅ Recover from state disasters
- ✅ Split and merge state files
- ✅ Move resources between states

### Terraform Skills
- ✅ Backend configuration
- ✅ State file structure understanding
- ✅ Lock handling and troubleshooting
- ✅ Import blocks (modern approach)
- ✅ Remote state data sources
- ✅ Workspace management

### Production Best Practices
- ✅ Always use remote state
- ✅ Enable state locking
- ✅ Backup state regularly
- ✅ Never manually edit state
- ✅ Use state commands cautiously
- ✅ Document state changes
- ✅ Test state operations in non-prod first

## ⚠️ Critical State Management Rules

**DO**:
- ✅ Use remote state (S3, Terraform Cloud)
- ✅ Enable state locking
- ✅ Backup state before surgery
- ✅ Use `terraform state` commands
- ✅ Test in non-production first
- ✅ Document all state changes

**DON'T**:
- ❌ Manually edit state files
- ❌ Delete state files (backup first!)
- ❌ Share local state files
- ❌ Commit state to Git
- ❌ Force-unlock without understanding why
- ❌ Run concurrent applies without locking

## 💰 Cost Information

**All state operations are FREE**:
- S3 state storage: $0.00 (tiny files)
- State locking: $0.00 (native S3 locking)
- DynamoDB (if used): $0.00 (free tier)

**Total series cost**: $0.00

## 🔧 State Surgery Techniques

This series teaches advanced "state surgery" techniques:

### 1. Resource Renaming
Move resources within same state:
```bash
terraform state mv aws_instance.old aws_instance.new
```

### 2. Module Refactoring
Move resources into modules:
```bash
terraform state mv aws_instance.web module.web.aws_instance.server
```

### 3. State Splitting
Extract resources to new state file:
```bash
terraform state pull > backup.tfstate
terraform state rm aws_rds_instance.db
# Import to new state file
```

### 4. State Merging
Combine multiple states:
```bash
terraform state pull > state1.json
# Import resources from state2 into state1
```

### 5. Import Existing Infrastructure
Bring unmanaged resources under Terraform:
```bash
terraform import aws_instance.web i-1234567890abcdef0
```

### 6. Disaster Recovery
Recover from deleted resources:
```bash
# Restore from backup
terraform state push backup.tfstate
# Re-import if needed
```

## 📊 Skills Matrix

| Skill | Ex 01 | Ex 02 | Ex 03 | Ex 04 | Challenge |
|-------|-------|-------|-------|-------|-----------|
| Remote backend | ✅ | ✅ | ✅ | ✅ | ✅ |
| State migration | ✅ | | | | ✅ |
| State list/show | | ✅ | ✅ | | ✅ |
| State mv/rm | | ✅ | | | ✅ |
| Import resources | | | ✅ | | ✅ |
| State locking | | | | ✅ | ✅ |
| Force unlock | | | | ✅ | ✅ |
| Split/merge state | | | | | ✅ |
| Disaster recovery | | | | | ✅ |
| Remote state data | | | | | ✅ |

## 🎓 Real-World Scenarios

These exercises prepare you for common real-world situations:

**Scenario 1: Team Migration**
- Move from local state to remote S3 backend
- Exercise 01 covers this

**Scenario 2: Refactoring**
- Reorganize resources into modules
- Exercise 02 teaches state mv

**Scenario 3: Brownfield**
- Existing AWS infrastructure needs Terraform management
- Exercise 03 teaches import

**Scenario 4: Lock Conflict**
- CI/CD pipeline stuck, state locked
- Exercise 04 teaches force-unlock

**Scenario 5: State Disaster**
- Accidentally destroyed critical resources
- Challenge teaches recovery techniques

## 🔗 Related Course Material

This series complements:
- **Course Lab 0**: Initial state setup
- **Production**: Team collaboration
- **Best Practices**: State management

## 🚀 After This Series

### Next Topics
- **Workspaces**: Multiple environments in one config
- **Modules**: Reusable infrastructure patterns
- **CI/CD**: Automated Terraform pipelines

### Advanced State Topics (Not in Gym)
- Terraform Cloud remote operations
- State encryption at rest
- State version control and rollback
- Sentinel policies for state operations
- Cross-account state access

## 💡 Pro Tips

1. **Always backup before state surgery**
   ```bash
   terraform state pull > backup-$(date +%s).tfstate
   ```

2. **Use -dry-run when available**
   ```bash
   terraform plan  # Always preview first
   ```

3. **Test state operations in dev first**
   - Never practice on production state
   - Use this gym for safe practice!

4. **Document state changes**
   - Keep a log of what you moved/removed
   - Include why and when

5. **Automate backups**
   - Backup state before every apply
   - Store backups in versioned S3 bucket

6. **Use import blocks (Terraform 1.5+)**
   - Declarative alternative to `terraform import`
   - Easier to review and version control

## 🆘 Getting Help

- **State corrupted**: Restore from backup
- **Lock stuck**: Check who has the lock first
- **Import failing**: Verify resource ID format
- **Still stuck**: Check Terraform state command docs

## ⚠️ Warning: State Surgery is Powerful

State manipulation is powerful and dangerous:
- Can cause data loss if done incorrectly
- Always backup first
- Test in non-production
- Understand what each command does
- This gym provides safe practice environment!

---

**Ready to start?** Begin with [Exercise 01: Remote Backend](exercise-01-remote-backend/)!

**Feeling brave?** Master state surgery in the [Challenge](challenge-state-surgery/)!
