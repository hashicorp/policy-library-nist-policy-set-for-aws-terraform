# S3 general purpose buckets should have event notifications enabled

| Provider            |  Category |
| ------------------- |  -------  |
| Amazon Web Services |  Logging  |

## Description

DISCLAIMER - This policy works when all resources of type aws_s3_bucket and aws_s3_bucket_notification are present in the root module.

This control checks whether S3 Event Notifications are enabled on an Amazon S3 general purpose bucket. The control fails if S3 Event Notifications are not enabled on the bucket. If you provide custom values for the eventTypes parameter, the control passes only if event notifications are enabled for the specified types of events.

When you enable S3 Event Notifications, you receive alerts when specific events occur that impact your S3 buckets. For example, you can be notified of object creation, object removal, and object restoration.

This rule is covered by the [s3-bucket-should-have-event-notifications-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/s3/s3-bucket-should-have-event-notifications-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - s3-bucket-should-have-event-notifications-enabled.sentinel

        Description:
        S3 Buckets should have event notifications enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy s3-bucket-should-have-event-notifications-enabled.

        ✓ Found 0 resource violations

        s3-bucket-should-have-event-notifications-enabled.sentinel:73:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - s3-bucket-should-have-event-notifications-enabled.sentinel

        Description:
        S3 Buckets should have event notifications enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy s3-bucket-should-have-event-notifications-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_s3_bucket.bucket
            | ✗ failed
            | S3 Buckets should have event notifications enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/s3-controls.html#s3-11 for more details.


        s3-bucket-should-have-event-notifications-enabled.sentinel:73:1 - Rule "main"
        Value:
            false
```

---
