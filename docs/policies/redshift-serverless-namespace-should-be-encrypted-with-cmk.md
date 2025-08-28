# Redshift Serverless namespaces should be encrypted with customer managed AWS KMS keys

| Provider            |       Category     |
| ------------------- |  ----------------  |
| Amazon Web Services |  Data Protection   |

## Description

DISCLAIMER - This policy only checks if the kms_key_id is present or not in the aws_redshiftserverless_namespace and does not validate the kms key.

This control checks whether an Amazon Redshift Serverless namespace is encrypted at rest with a customer managed AWS KMS key. The control fails if the Redshift Serverless namespace isn't encrypted with a customer managed KMS key. You can optionally specify a list of KMS keys for the control to include in the evaluation.

In Amazon Redshift Serverless, a namespace defines a logical container for database objects. This control periodically checks whether the encryption settings for a namespace specify a customer managed AWS KMS key, instead of an AWS managed KMS key, for encryption of data in the namespace.

This rule is covered by the [redshift-serverless-namespace-should-be-encrypted-with-cmk](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/redshiftserverless/redshift-serverless-namespace-should-be-encrypted-with-cmk.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - redshift-serverless-namespace-should-be-encrypted-with-cmk.sentinel

        Description:
        This policy requires that resources of type `aws_redshiftserverless_namespace`
        have encryption enabled with customer managed KMS key.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy redshift-serverless-namespace-should-be-encrypted-with-cmk.

        ✓ Found 0 resource violations

        redshift-serverless-namespace-should-be-encrypted-with-cmk.sentinel:47:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - redshift-serverless-namespace-should-be-encrypted-with-cmk.sentinel

        Description:
        This policy requires that resources of type `aws_redshiftserverless_namespace`
        have encryption enabled with customer managed KMS key.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy redshift-serverless-namespace-should-be-encrypted-with-cmk.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_redshiftserverless_namespace.example
            | ✗ failed
            | Attribute 'kms_key_id' must be present for 'aws_redshiftserverless_namespace' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/redshiftserverless-controls.html#redshiftserverless-4 for more details.


        redshift-serverless-namespace-should-be-encrypted-with-cmk.sentinel:47:1 - Rule "main"
        Value:
            false
```

---
