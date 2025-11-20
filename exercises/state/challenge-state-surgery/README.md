# State Challenge: State Surgery

**Time**: 90 minutes | **Difficulty**: Expert | **Cost**: $0.00

## 🎯 Challenge Overview

Perform complex "state surgery" operations to handle real-world disaster scenarios and infrastructure reorganization. **NO skeleton code** - you'll create scenarios and fix them!

## 📋 Scenarios to Complete

### Scenario 1: Split Monolithic State (30 min)
**Situation**: All infrastructure in one state file. Need to split into app and database states.

**Tasks**:
1. Create monolithic infrastructure (5 S3 buckets)
2. Split into two separate state files:
   - `app-state`: 3 app buckets
   - `db-state`: 2 database buckets
3. Verify both states work independently

**Skills**: `state mv`, `state rm`, `state push/pull`, backend configuration

---

### Scenario 2: Import & Merge (25 min)
**Situation**: Manually created resources need to be merged into existing Terraform state.

**Tasks**:
1. Create 2 buckets with Terraform
2. Create 2 buckets manually (AWS CLI)
3. Import manual buckets into same state
4. Verify all 4 buckets managed together

**Skills**: `terraform import`, import blocks, resource configuration

---

### Scenario 3: Disaster Recovery (20 min)
**Situation**: Someone accidentally destroyed critical infrastructure. Recreate from state backup.

**Tasks**:
1. Create infrastructure
2. Backup state
3. Simulate disaster (`terraform destroy`)
4. Recover from backup
5. Verify everything restored

**Skills**: `state pull/push`, backup procedures, recovery

---

### Scenario 4: Module Refactoring (35 min)
**Situation**: Resources need to move into reusable modules.

**Tasks**:
1. Create 3 buckets as root resources
2. Create a module for S3 buckets
3. Move resources into module instances
4. Verify configuration still works

**Skills**: `state mv` to modules, module addressing, refactoring

---

### Scenario 5: Cross-State References (NEW!)
**Situation**: App state needs data from database state.

**Tasks**:
1. Create database infrastructure with outputs
2. Create app infrastructure that references database outputs
3. Use `terraform_remote_state` data source
4. Verify cross-state communication

**Skills**: Remote state data sources, output dependencies

---

## 📚 Documentation Resources

### Core Commands
- [State Commands](https://developer.hashicorp.com/terraform/cli/commands/state)
- [State Push/Pull](https://developer.hashicorp.com/terraform/cli/commands/state/push)
- [Import](https://developer.hashicorp.com/terraform/cli/commands/import)

### New Resources (research!)
- [terraform_remote_state](https://developer.hashicorp.com/terraform/language/state/remote-state-data)
- [Moved Block](https://developer.hashicorp.com/terraform/language/modules/develop/refactoring)

## ✅ Success Criteria

- ✅ Completed all 5 scenarios
- ✅ No resources destroyed accidentally
- ✅ All state files valid and working
- ✅ Can apply changes to all states
- ✅ Documented what you did
- ✅ Score 90+ on validator

## 🚫 Rules

- No skeleton code provided
- Must create your own scenarios
- Document each step
- Backup before surgery!
- Test recovery procedures

## 💡 Pro Tips

### Backup Strategy
```bash
# Always backup before state surgery!
terraform state pull > backup-$(date +%s).tfstate
```

### Safe State Move Pattern
```bash
# 1. Plan before moving
terraform plan -out=before.plan

# 2. Move resource
terraform state mv SOURCE DEST

# 3. Update .tf files to match

# 4. Verify no changes
terraform plan
# Should show: No changes. Infrastructure is up-to-date.
```

### Module Move Pattern
```bash
# Moving resource into module
terraform state mv aws_s3_bucket.app module.s3_app.aws_s3_bucket.bucket
```

### Split State Pattern
```bash
# 1. Pull current state
terraform state pull > full-state.json

# 2. Remove resources for new state
terraform state rm aws_s3_bucket.db1 aws_s3_bucket.db2

# 3. In new directory with new backend
# Import those resources using import blocks
```

## ⚠️ Critical Warnings

**NEVER**:
- ❌ Edit state files manually
- ❌ Delete state without backup
- ❌ Run concurrent operations
- ❌ Force-unlock without knowing why
- ❌ Practice on production!

**ALWAYS**:
- ✅ Backup before surgery
- ✅ Test in this gym first
- ✅ Verify with `terraform plan`
- ✅ Document what you did
- ✅ Keep backups versioned

## 🎓 Learning Objectives

This challenge tests your ability to:
- ✅ Safely manipulate state files
- ✅ Split and merge states
- ✅ Recover from disasters
- ✅ Refactor infrastructure
- ✅ Work with remote state data
- ✅ Handle complex dependencies
- ✅ Document state changes

## 📝 Documentation Template

For each scenario, document:

```markdown
## Scenario X: [Name]

### Initial State
- Resources: [list]
- State files: [list]

### Steps Taken
1. [Step 1]
2. [Step 2]
...

### Commands Used
```bash
[commands]
```

### Verification
- `terraform plan` output: [result]
- Resources in state: [count]

### Lessons Learned
- [what went wrong/right]
- [what you'd do differently]
```

## 🏆 Mastery Checklist

After completing this challenge, you should be able to:

- [ ] Split monolithic state into multiple files
- [ ] Merge multiple states into one
- [ ] Import existing resources
- [ ] Move resources between states
- [ ] Refactor flat resources into modules
- [ ] Recover from state disasters
- [ ] Use remote state data sources
- [ ] Explain when to use each state command
- [ ] Backup and restore state safely
- [ ] Handle state locking issues

## 🔧 Tools Needed

**Required**:
- Terraform 1.9.0+
- AWS CLI
- jq (for JSON inspection)
- Text editor

**Helpful**:
```bash
# State inspection
terraform state list
terraform state show RESOURCE

# State backup
alias tfbackup='terraform state pull > backup-$(date +%s).tfstate'

# Pretty print state
terraform state pull | jq . > state-readable.json
```

## 💭 Reflection Questions

After completing:
1. What was the scariest moment?
2. Which scenario was hardest? Why?
3. What would you do differently in production?
4. How confident are you with state surgery now?
5. What additional practice do you need?

---

**This is advanced Terraform!** Take your time, backup everything, and learn from mistakes. That's what the gym is for! 🏋️
