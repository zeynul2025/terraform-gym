# Exercise 03: IAM Groups

**Time**: 20 minutes | **Difficulty**: Intermediate | **Cost**: $0.00

## Objective

Create IAM groups and organize users by attaching policies to groups instead of individual users.

## What You'll Practice

- Creating IAM groups
- Adding users to groups
- Attaching policies to groups
- Group-based access control patterns

## Instructions

1. Create two IAM groups (developers, admins)
2. Create two IAM users
3. Add users to appropriate groups
4. Attach different managed policies to each group

## Success Criteria

- ✅ Two IAM groups created
- ✅ Two IAM users created
- ✅ Users assigned to groups
- ✅ Policies attached to groups (not users)

## Key Concepts

**Group-based Access**: Best practice for managing permissions at scale
- Policies attached to groups, not users
- Users inherit permissions from groups
- One user can be in multiple groups

## Related Docs

- [aws_iam_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)
- [aws_iam_group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership)
- [aws_iam_group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment)
