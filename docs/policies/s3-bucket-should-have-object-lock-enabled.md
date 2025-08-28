# S3 general purpose buckets should have Object Lock enabled

| Provider            |     Category      |
| ------------------- | ----------------- |
| Amazon Web Services |  Data Protection  |

## Description

DISCLAIMER - This policy works when all resources of type aws_s3_bucket and aws_s3_bucket_object_lock_configuration are present in the root module.

This control checks whether an Amazon S3 general purpose bucket has Object Lock enabled. The control fails if Object Lock isn't enabled for the bucket. If you provide a custom value for the mode parameter, the control passes only if S3 Object Lock uses the specified retention mode.

You can use S3 Object Lock to store objects using a write-once-read-many (WORM) model. Object Lock can help prevent objects in S3 buckets from being deleted or overwritten for a fixed amount of time or indefinitely.

This rule is covered by the [s3-bucket-should-have-object-lock-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-should-have-object-lock-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - s3-bucket-should-have-object-lock-enabled.sentinel

        Description:
        S3 Buckets should have object lock enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-should-have-object-lock-enabled.

        ✓ Found 0 resource violations

        s3-bucket-should-have-object-lock-enabled.sentinel:89:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - s3-bucket-should-have-object-lock-enabled.sentinel

        Description:
        S3 Buckets should have object lock enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-should-have-object-lock-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket.bucket
            | ✗ failed
            | S3 Buckets should have object lock enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-15 for more details.


        s3-bucket-should-have-object-lock-enabled.sentinel:89:1 - Rule "main"
        Value:
            false
```

---
