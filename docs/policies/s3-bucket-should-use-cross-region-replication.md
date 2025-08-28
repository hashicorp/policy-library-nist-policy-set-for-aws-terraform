# S3 general purpose buckets should use cross-Region replication

| Provider            |          Category          |
| ------------------- | -------------------------- |
| Amazon Web Services |  Secure Access Management  |

## Description

DISCLAIMER - This policy works when all resources of type aws_s3_bucket and aws_s3_bucket_replication_configuration are present in the root module.

This control checks whether an Amazon S3 general purpose bucket has cross-Region replication enabled. The control fails if the bucket doesn't have cross-Region replication enabled.

Replication is the automatic, asynchronous copying of objects across buckets in the same or different AWS Regions. Replication copies newly created objects and object updates from a source bucket to a destination bucket or buckets. AWS best practices recommend replication for source and destination buckets that are owned by the same AWS account. In addition to availability, you should consider other systems hardening settings.

This control produces a FAILED finding for a replication destination bucket if it doesn't have cross-region replication enabled. If there's a legitimate reason that the destination bucket doesn't need cross-region replication to be enabled, you can suppress findings for this bucket.

This rule is covered by the [s3-bucket-should-use-cross-region-replication](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-should-use-cross-region-replication.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - s3-bucket-should-use-cross-region-replication.sentinel

        Description:
        S3 Buckets should have cross-region replication enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-should-use-cross-region-replication.

        ✓ Found 0 resource violations

        s3-bucket-should-use-cross-region-replication.sentinel:73:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - s3-bucket-should-use-cross-region-replication.sentinel

        Description:
        S3 Buckets should have cross-region replication enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-should-use-cross-region-replication.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket.source
            | ✗ failed
            | S3 Buckets should have cross-region replication enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-7 for more details.


        s3-bucket-should-use-cross-region-replication.sentinel:73:1 - Rule "main"
        Value:
            false
```

---
