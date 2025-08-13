# CloudWatch log groups should be retained for a specified time period

| Provider            | Category  |
|---------------------|-----------|
| Amazon Web Services | Logging   |

## Description

This control checks whether an Amazon CloudWatch log group has a retention period of at least the specified number of days. The control fails if the retention period is less than the specified number. Unless you provide a custom parameter value for the retention period, Security Hub uses a default value of 365 days.

CloudWatch Logs centralize logs from all of your systems, applications, and AWS services in a single, highly scalable service. You can use CloudWatch Logs to monitor, store, and access your log files from Amazon Elastic Compute Cloud (EC2) instances, AWS CloudTrail, Amazon Route 53, and other sources. Retaining your logs for at least 1 year can help you comply with log retention standards.

This rule is covered by the [cloudwatch-log-groups-should-be-retained-for-a-specified-time-period](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudwatch/cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel

      Description:
        This control checks whether an Amazon CloudWatch log group has a retention
        period of at least the specified number of days.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudwatch-log-groups-retention-period.

      ✓ Found 0 resource violations

      cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel:58:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel

      Description:
        This control checks whether an Amazon CloudWatch log group has a retention
        period of at least the specified number of days.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudwatch-log-groups-retention-period.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudwatch_log_group.log_group
          | ✗ failed
          | CloudWatch Log Groups should have a retention period of at least 365 days or be set to never expire (0). Refer to AWS security best practices for more details.


      cloudwatch-log-groups-should-be-retained-for-a-specified-time-period.sentinel:58:1 - Rule "main"
        Value:
          false
```

---