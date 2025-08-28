# SNS topics should be encrypted at-rest using AWS KMS

| Provider            |       Category     |
| ------------------- |  ----------------  |
| Amazon Web Services |  Data Protection   |

## Description

DISCLAIMER - This policy only checks if the kms_key_id is present or not in the aws_redshiftserverless_namespace and does not validate the kms key.

This control checks whether an Amazon SNS topic is encrypted at rest using keys managed in AWS Key Management Service (AWS KMS). The controls fails if the SNS topic doesn't use a KMS key for server-side encryption (SSE). By default, SNS stores messages and files using disk encryption. To pass this control, you must choose to use a KMS key for encryption instead. This adds an additional layer of security and provides more access control flexibility.

This rule is covered by the [sns-topic-should-be-encrypted-at-rest](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/sns/sns-topic-should-be-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - sns-topic-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires that resources of type `aws_sns_topic` have encryption
        enabled with KMS key.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy sns-topic-should-be-encrypted-at-rest.

        ✓ Found 0 resource violations

        sns-topic-should-be-encrypted-at-rest.sentinel:47:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - sns-topic-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires that resources of type `aws_sns_topic` have encryption
        enabled with KMS key.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sns-topic-should-be-encrypted-at-rest.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_sns_topic.user_updates
            | ✗ failed
            | Attribute 'kms_master_key_id' must be present for 'aws_sns_topic' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/sns-controls.html#sns-1 for more details.


        sns-topic-should-be-encrypted-at-rest.sentinel:47:1 - Rule "main"
        Value:
            false
```

---
