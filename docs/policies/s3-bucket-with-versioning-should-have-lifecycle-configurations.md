# S3 general purpose buckets with versioning enabled should have Lifecycle configurations

| Provider            |  Category |
| ------------------- | --------- |
| Amazon Web Services |  Logging  |

## Description

DISCLAIMER - This policy works when all resources of type aws_s3_bucket, aws_s3_bucket_versioning and aws_s3_bucket_lifecycle_configuration are present in the root module.

This control checks whether an Amazon S3 general purpose versioned bucket has a Lifecycle configuration. The control fails if the bucket doesn't have a Lifecycle configuration.

We recommended creating a Lifecycle configuration for your S3 bucket to help you define actions that you want Amazon S3 to take during an object's lifetime.

This rule is covered by the [s3-bucket-with-versioning-should-have-lifecycle-configurations](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-with-versioning-should-have-lifecycle-configurations.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - s3-bucket-with-versioning-should-have-lifecycle-configurations.sentinel

        Description:
        S3 Buckets with versioning should have lifecycle configurations

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-with-versioning-should-have-lifecycle-configurations.

        ✓ Found 0 resource violations

        s3-bucket-with-versioning-should-have-lifecycle-configurations.sentinel:96:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - s3-bucket-with-versioning-should-have-lifecycle-configurations.sentinel

        Description:
        S3 Buckets with versioning should have lifecycle configurations

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-with-versioning-should-have-lifecycle-configurations.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket.bucket
            | ✗ failed
            | S3 Buckets with versioning should have lifecycle configurations. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-10 for more details.


        s3-bucket-with-versioning-should-have-lifecycle-configurations.sentinel:96:1 - Rule "main"
        Value:
            false
```

---
