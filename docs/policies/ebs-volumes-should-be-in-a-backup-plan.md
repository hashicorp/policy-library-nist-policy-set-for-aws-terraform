# Attached Amazon EBS volumes should be encrypted at-rest

| Provider            |           Category           |
|---------------------| ---------------------------- |
| Amazon Web Services | Secure Backups enabled |

## Description

DISCLAIMER - This policy works when all resources of type aws_backup_selection, aws_backup_plan and aws_backup_vault are present in the root module.

This control evaluates if an Amazon EBS volume in in-use state is covered by a backup plan. The control fails if an EBS volume isn't covered by a backup plan. If you set the backupVaultLockCheck parameter equal to true, the control passes only if the EBS volume is backed up in an AWS Backup locked vault.

Backups help you recover more quickly from a security incident. They also strengthen the resilience of your systems. Including Amazon EBS volumes in a backup plan helps you protect your data from unintended loss or deletion.

This rule is covered by the [ebs-volumes-should-be-in-a-backup-plan](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ebs-volumes-should-be-in-a-backup-plan.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - ebs-volumes-should-be-in-a-backup-plan.sentinel

    Description:
    This control evaluates if an Amazon EBS volume in in-use state is covered by a
    backup plan.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ebs-volumes-should-be-in-a-backup-plan.

    ✓ Found 0 resource violations

    ebs-volumes-should-be-in-a-backup-plan.sentinel:64:1 - Rule "main"
        Description:
            Rules

        Value:
            true

```

---

## Policy Results (Fail)
```bash
trace:

    Fail - ebs-volumes-should-be-in-a-backup-plan.sentinel

    Description:
    This control evaluates if an Amazon EBS volume in in-use state is covered by a
    backup plan.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ebs-volumes-should-be-in-a-backup-plan.

    Found 1 resource violations

    → Module name: root
        ↳ Resource Address: aws_ebs_volume.example
            | ✗ failed
            | EBS volumes should be included in AWS Backup plans. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-28 for more details.


    ebs-volumes-should-be-in-a-backup-plan.sentinel:64:1 - Rule "main"
        Description:
            Rules

        Value:
            false
        
```
---