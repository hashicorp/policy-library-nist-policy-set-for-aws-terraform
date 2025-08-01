# AWS DMS Replication Task should have Logging enabled for the attrinute 'replication_task_settings' for target db

| Provider            |    Category   |
| ------------------- |   ---------   |
| Amazon Web Services |    Logging    |

## Description

This control checks whether logging is enabled with the minimum severity level of LOGGER_SEVERITY_DEFAULT for DMS replication tasks TARGET_APPLY and TARGET_LOAD. The control fails if logging isn't enabled for these tasks or if the minimum severity level is less than LOGGER_SEVERITY_DEFAULT.

DMS uses Amazon CloudWatch to log information during the migration process. Using logging task settings, you can specify which component activities are logged and how much information is logged. You should specify logging for the following tasks:

  - TARGET_APPLY – Data and data definition language (DDL) statements are applied to the target database.
  - TARGET_LOAD – Data is loaded into the target database.

This rule is covered by the [dms-replication-task-logging-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/dms-replication-task-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - dms-repliction-task-targetdb-logging-enabled.sentinel

        Description:
        This policy checks if resources of type 'aws_dms_replication_task' have the
        'replication_task_settings'
        have logging enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy dms-replication-instances-should-not-be-public.

        ✓ Found 0 resource violations

        dms-repliction-task-targetdb-logging-enabled.sentinel:84:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - dms-repliction-task-targetdb-logging-enabled.sentinel

        Description:
        This policy checks if resources of type 'aws_dms_replication_task' have the
        'replication_task_settings'
        have logging enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dms-replication-instances-should-not-be-public.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_dms_replication_task.test
            | ✗ failed
            | Attribute 'replication_task-settings' should have the logging enabled for AWS DMS Replication Task.Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-7 for more details.


        dms-repliction-task-targetdb-logging-enabled.sentinel:84:1 - Rule "main"
        Value:
            false
```

---
