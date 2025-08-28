# S3 general purpose buckets should have versioning enabled

| Provider            |     Category      |
| ------------------- | ----------------- |
| Amazon Web Services |  Data Protection  |

## Description

DISCLAIMER - This policy works when all resources of type aws_s3_bucket and aws_s3_bucket_versioning are present in the root module.

This control checks whether an Amazon S3 general purpose bucket has versioning enabled. The control fails if versioning is suspended for the bucket.

Versioning keeps multiple variants of an object in the same S3 bucket. You can use versioning to preserve, retrieve, and restore earlier versions of an object stored in your S3 bucket. Versioning helps you recover from both unintended user actions and application failures.

This rule is covered by the [s3-bucket-should-have-versioning-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-should-have-versioning-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - s3-bucket-should-have-versioning-enabled.sentinel

        Description:
        S3 Buckets should have versioning enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-should-have-versioning-enabled.

        ✓ Found 0 resource violations

        s3-bucket-should-have-versioning-enabled.sentinel:74:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - s3-bucket-should-have-versioning-enabled.sentinel

        Description:
        S3 Buckets should have versioning enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-should-have-versioning-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket.bucket
            | ✗ failed
            | S3 Buckets should have versioning enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-14 for more details.


        s3-bucket-should-have-versioning-enabled.sentinel:74:1 - Rule "main"
        Value:
            false
```

---
