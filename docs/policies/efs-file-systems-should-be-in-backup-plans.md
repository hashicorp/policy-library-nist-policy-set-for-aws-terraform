# Amazon EFS volumes should be in backup plans

| Provider            | Category |
| ------------------- |  ------- |
| Amazon Web Services |  Backup  |

## Description

DISCLAIMER - This policy works when all resources of type aws_efs_file_system and aws_backup_selection are present in the root module.

This control checks whether Amazon Elastic File System (Amazon EFS) file systems are added to the backup plans in AWS Backup. The control fails if Amazon EFS file systems are not included in the backup plans.

Including EFS file systems in the backup plans helps you to protect your data from deletion and data loss.

This rule is covered by the [efs-file-systems-should-be-in-backup-plans](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/efs/efs-file-systems-should-be-in-backup-plans.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - efs-file-systems-should-be-in-backup-plans.sentinel

        Description:
        This policy requires resources of type `aws_efs_file_system` should be
        associated with resource 'aws_backup_selection'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy efs-file-systems-should-be-in-backup-plans.

        ✓ Found 0 resource violations

        efs-file-systems-should-be-in-backup-plans.sentinel:72:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - efs-file-systems-should-be-in-backup-plans.sentinel

        Description:
        This policy requires resources of type `aws_efs_file_system` should be
        associated with resource 'aws_backup_selection'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-file-systems-should-be-in-backup-plans.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_efs_file_system.example
            | ✗ failed
            | AWS EFS file systems should be included in backup plans. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-2 for more details.


        efs-file-systems-should-be-in-backup-plans.sentinel:72:1 - Rule "main"
        Value:
            false
```

---
