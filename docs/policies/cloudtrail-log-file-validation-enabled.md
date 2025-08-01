# Cloudtrail LogFile Validation is enabled

| Provider            |         Category        |
|---------------------| ----------------------- |
| Amazon Web Services |     Data protection     |

## Description

This control checks whether log file integrity validation is enabled on a CloudTrail trail.

CloudTrail log file validation creates a digitally signed digest file that contains a hash of each log that CloudTrail writes to Amazon S3. You can use these digest files to determine whether a log file was changed, deleted, or unchanged after CloudTrail delivered the log.

Security Hub recommends that you enable file validation on all trails. Log file validation provides additional integrity checks of CloudTrail logs.
This rule is covered by the [cloudtrail-log-file-validation-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - cloudtrail-log-file-validation-enabled.sentinel

    Description:
      This policy requires resources of type `aws_cloudtrail` to have log file
      validation enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudtrail-log-file-validation-enabled.

    ✓ Found 0 resource violations

    cloudtrail-log-file-validation-enabled.sentinel:37:1 - Rule "main"
      Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:
    Fail - cloudtrail-log-file-validation-enabled.sentinel

    Description:
      This policy requires resources of type `aws_cloudtrail` to have log file
      validation enabled.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-log-file-validation-enabled.

    Found 1 resource violations

    → Module name: root
       ↳ Resource Address: aws_cloudtrail.example
         | ✗ failed
         | Attribute 'enable_log_file_validation' must be true for 'aws_cloudtrail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-4 for more details.


    cloudtrail-log-file-validation-enabled.sentinel:37:1 - Rule "main"
      Value:
        false

```
---
