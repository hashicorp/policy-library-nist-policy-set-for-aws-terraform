# ECR repositories should be encrypted with customer managed AWS KMS keys

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Data Protection   |

## Description

DISCLAIMER - This policy works when all resources of type aws_ecr_repository and aws_kms_key are present in the root module.

This control checks whether an Amazon ECR repository is encrypted at rest with a customer managed AWS KMS key. The control fails if the ECR repository isn't encrypted with a customer managed KMS key. You can optionally specify a list of KMS keys for the control to include in the evaluation.

By default, Amazon ECR encrypts repository data with Amazon S3 managed keys (SSE-S3), using an AES-256 algorithm. For additional control, you can configure Amazon ECR to encrypt the data with an AWS KMS key (SSE-KMS or DSSE-KMS) instead. The KMS key can be: an AWS managed key that Amazon ECR creates and manages for you and has the alias aws/ecr, or a customer managed key that you create and manage in your AWS account. With a customer managed KMS key, you have full control of the key. This includes defining and maintaining the key policy, managing grants, rotating cryptographic material, assigning tags, creating aliases, and enabling and disabling the key.

This rule is covered by the [ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ecr/ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel

      Description:
        This control checks whether an Amazon ECR repository is encrypted at rest with
        a customer managed AWS KMS key.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.

      ✓ Found 0 resource violations

      ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel:54:1 - Rule "main"
        Description:
          Rules

        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel

      Description:
        This control checks whether an Amazon ECR repository is encrypted at rest with
        a customer managed AWS KMS key.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_ecr_repository.compliant_repository
          | ✗ failed
          | ECR repositories must be encrypted with customer-managed KMS keys. Refer to AWS security best practices for more details.


      ecr-repositories-should-be-encrypted-with-customer-managed-aws-kms-keys.sentinel:54:1 - Rule "main"
        Description:
          Rules

        Value:
          false
```

---