# S3 general purpose buckets should be encrypted at rest with AWS KMS keys

| Provider            |  Category |
| ------------------- | --------- |
| Amazon Web Services |  Logging  |

## Description

DISCLAIMER - This policy works when all resources of type aws_s3_bucket, aws_s3_bucket_versioning and aws_s3_bucket_server_side_encryption_configuration are present in the root module.

This control checks whether an Amazon S3 general purpose bucket is encrypted with an AWS KMS key (SSE-KMS or DSSE-KMS). The control fails if the bucket is encrypted with default encryption (SSE-S3).

Server-side encryption (SSE) is the encryption of data at its destination by the application or service that receives it. Unless you specify otherwise, S3 buckets use Amazon S3 managed keys (SSE-S3) by default for server-side encryption.

This rule is covered by the [s3-bucket=should-be-encrypted-at-rest](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket=should-be-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - s3-bucket-should-be-encrypted-at-rest.sentinel

        Description:
        S3 Buckets should have encryption enabled at rest with AWS KMS Key

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket=should-be-encrypted-at-rest.

        ✓ Found 0 resource violations

        s3-bucket-should-be-encrypted-at-rest.sentinel:99:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - s3-bucket-should-be-encrypted-at-rest.sentinel

        Description:
        S3 Buckets should have encryption enabled at rest with AWS KMS Key

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket=should-be-encrypted-at-rest.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket.bucket
            | ✗ failed
            | S3 Buckets should have encryption enabled at rest with AWS KMS Key. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-17 for more details.


        s3-bucket-should-be-encrypted-at-rest.sentinel:99:1 - Rule "main"
        Value:
            false
```

---
