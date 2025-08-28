# Cloudtrail Cloudwatch Logs Group Arn is set

| Provider            |  Category |
|---------------------| --------- |
| Amazon Web Services |  Data Protection  |

## Description

This control checks whether an AWS CloudTrail Lake event data store is encrypted at rest with a customer managed AWS KMS key. The control fails if the event data store isn't encrypted with a customer managed KMS key. You can optionally specify a list of KMS keys for the control to include in the evaluation.

By default, AWS CloudTrail Lake encrypts event data stores with Amazon S3 managed keys (SSE-S3), using an AES-256 algorithm. For additional control, you can configure CloudTrail Lake to encrypt an event data store with a customer managed AWS KMS key (SSE-KMS) instead. A customer managed KMS key is an AWS KMS key that you create, own, and manage in your AWS account. You have full control over this type of KMS key. This includes defining and maintaining the key policy, managing grants, rotating cryptographic material, assigning tags, creating aliases, and enabling and disabling the key. You can use a customer managed KMS key in cryptographic operations for your CloudTrail data and audit usage with CloudTrail logs.

This rule is covered by the [cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudtrail/cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass -  cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel

    Description:
      Rules

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.

    ✓ Found 0 resource violations

    cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel:39:1 - Rule "main"
      Description:
        Rules

      Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:
    Fail - cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel

    Description:
        Rules

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.

    Found 1 resource violations

    → Module name: root
        ↳ Resource Address: aws_cloudtrail_event_data_store.compliant_event_data_store
            | ✗ failed
            | CloudTrail Event Data Stores must be encrypted with a KMS key. Specify a valid KMS key ID in the 'kms_key_id' attribute.


    cloudtrail-lake-event-data-stores-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel:38:1 - Rule "main"
    Description:
        Rules

    Value:
        false

```

---
