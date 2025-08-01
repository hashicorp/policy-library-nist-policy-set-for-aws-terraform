# AWS Macie Account should have the status attribute set to "ENABLED"

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks whether Amazon Macie is enabled for an account. The control fails if Macie isn't enabled for the account.

Amazon Macie discovers sensitive data using machine learning and pattern matching, provides visibility into data security risks, and enables automated protection against those risks. Macie automatically and continually evaluates your Amazon Simple Storage Service (Amazon S3) buckets for security and access control, and generates findings to notify you of potential issues with the security or privacy of your Amazon S3 data.

This rule is covered by the [aws-macie-status-should-be-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/aws-macie-status-should-be-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
      Pass - aws-macie-status-should-be-enabled.sentinel

      Description:
        This policy checks if resources of type 'aws_macie2_account' have the 'status'
        attribute set to 'ENABLED'

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy aws-macie-status-should-be-enabled.

      ✓ Found 0 resource violations

      aws-macie-status-should-be-enabled.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)

```bash
trace:
      Fail - aws-macie-status-should-be-enabled.sentinel

      Description:
        This policy checks if resources of type 'aws_macie2_account' have the 'status'
        attribute set to 'ENABLED'

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy aws-macie-status-should-be-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_macie2_account.example
          | ✗ failed
          | Attribute 'status' should be 'ENABLED' for AWS Macie Account. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/macie-controls.html#macie-1 for more details.


      aws-macie-status-should-be-enabled.sentinel:47:1 - Rule "main"
        Value:
          false
```

---
