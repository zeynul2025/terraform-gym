# Exercise 02: State Commands

**Time**: 25 minutes | **Difficulty**: Intermediate | **Cost**: $0.00

## Objective

Master essential Terraform state commands for everyday operations. Learn when and how to safely manipulate state.

## What You'll Practice

- `terraform state list` - List all resources
- `terraform state show` - Inspect resource details
- `terraform state mv` - Rename/move resources
- `terraform state rm` - Remove from state
- Safe state manipulation techniques

## Instructions

1. Deploy infrastructure (2 S3 buckets)
2. List all resources in state
3. Show details of specific resource
4. Rename a resource using `state mv`
5. Remove a resource from state (without destroying)
6. Verify operations with `terraform plan`

## Success Criteria

- ✅ Listed all resources
- ✅ Inspected resource attributes
- ✅ Renamed resource in state
- ✅ Removed resource from state
- ✅ Infrastructure unchanged (only state modified)

## Key Concepts

**State List**:
```bash
terraform state list
# Shows all resource addresses
```

**State Show**:
```bash
terraform state show aws_s3_bucket.example
# Shows resource attributes in detail
```

**State Move**:
```bash
terraform state mv aws_s3_bucket.old aws_s3_bucket.new
# Renames resource in state
# Must also update .tf files!
```

**State Remove**:
```bash
terraform state rm aws_s3_bucket.unwanted
# Removes from state (resource still exists in AWS)
# Terraform no longer manages it
```

## When to Use State Commands

**Use `state mv`**:
- Refactoring: Moving resources into modules
- Renaming: Changing resource names
- Reorganizing: Better structure

**Use `state rm`**:
- Handing off: Another system will manage resource
- Orphaning: Keep resource but stop managing
- Cleanup: Remove from state without destroying

**Use `state show`**:
- Debugging: Check actual state values
- Inspection: Verify attributes
- Documentation: See what Terraform knows

## Related Docs

- [State Command](https://developer.hashicorp.com/terraform/cli/commands/state)
- [State mv](https://developer.hashicorp.com/terraform/cli/commands/state/mv)
- [State rm](https://developer.hashicorp.com/terraform/cli/commands/state/rm)
