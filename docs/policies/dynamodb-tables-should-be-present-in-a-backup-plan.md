#  Amazon Dynamo DB tables should scale its read and write capacity as needed

| Provider            | Category             |
| ------------------- | -------------------- |
| Amazon Web Services | Backups enabled      |

## Description

This control evaluates whether an Amazon DynamoDB table in ACTIVE state is covered by a backup plan. The control fails if the DynamoDB table isn't covered by a backup plan. If you set the backupVaultLockCheck parameter equal to true, the control passes only if the DynamoDB table is backed up in an AWS Backup locked vault.

AWS Backup is a fully managed backup service that helps you centralize and automate the backing up of data across AWS services. With AWS Backup, you can create backup plans that define your backup requirements, such as how frequently to back up your data and how long to retain those backups. Including DynamoDB tables in your backup plans helps you protect your data from unintended loss or deletion.


This rule is covered by the [dynamodb-tables-should-be-present-in-a-backup-plan](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/dynamo-db/dynamodb-tables-should-be-present-in-a-backup-plan.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - dynamodb-tables-should-be-present-in-a-backup-plan.sentinel

    Description:
    This control evaluates whether an Amazon DynamoDB table in ACTIVE state is covered by a backup plan

    Print messages:


    aws_dynamodb_table.example_table.arn

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy dynamodb-tables-should-be-present-in-a-backup-plan.

    ✓ Found 0 resource violations

    dynamodb-tables-should-be-present-in-a-backup-plan.sentinel:72:1 - Rule "main"
        Description:
            Rules

        Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - dynamodb-tables-should-be-present-in-a-backup-plan.sentinel

    Description:
    This control evaluates whether an Amazon DynamoDB table in ACTIVE state is covered by a backup plan

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dynamodb-tables-should-be-present-in-a-backup-plan.

    Found 1 resource violations

    → Module name: root
        ↳ Resource Address: aws_dynamodb_table.example_table
            | ✗ failed
            | DynamoDB tables should be included in an AWS Backup plan for data protection.


    dynamodb-tables-should-be-present-in-a-backup-plan.sentinel:69:1 - Rule "main"
    Description:
        Rules

    Value:
        false
```

---