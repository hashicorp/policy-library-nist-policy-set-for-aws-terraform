# AWS Glue Spark jobs should run on supported versions of AWS Glue

|      Provider       |       Category       |
| ------------------- | -------------------- |
| Amazon Web Services |  Version Management  |

## Description

This control checks whether an AWS Glue for Spark job is configured to run on a supported version of AWS Glue. The control fails if the Spark job is configured to run on a version of AWS Glue that's earlier than the minimum supported version.

Running AWS Glue Spark jobs on current versions of AWS Glue can optimize performance, security, and access to the latest features of AWS Glue. It can also help safeguard against security vulnerabilities. For example, a new version might be released to provide security updates, address issues, or introduce new features.

This rule is covered by the [glue-spark-job-supported-version](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/glue/glue-spark-job-supported-version.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - glue-spark-job-supported-version.sentinel

    Description:
    This policy ensures that AWS Glue Spark jobs use only supported Glue versions.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy glue-spark-job-supported-version.

    ✓ Found 0 resource violations

    glue-spark-job-supported-version.sentinel:66:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - glue-spark-job-supported-version.sentinel

    Description:
    This policy ensures that AWS Glue Spark jobs use only supported Glue versions.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy glue-spark-job-supported-version.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_glue_job.fail
        | ✗ failed
        | AWS Glue Spark jobs must use supported Glue versions. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/glue-controls.html#glue-4 for more details.


    glue-spark-job-supported-version.sentinel:66:1 - Rule "main"
    Value:
        false
```

---
