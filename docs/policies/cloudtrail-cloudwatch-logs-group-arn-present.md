# Cloudtrail Cloudwatch Logs Group Arn is set

| Provider            |  Category |
|---------------------| --------- |
| Amazon Web Services |  Logging  |

## Description

This control checks whether CloudTrail trails are configured to send logs to CloudWatch Logs. The control fails if the CloudWatchLogsLogGroupArn property of the trail is empty.

CloudTrail uses Amazon S3 for log file storage and delivery. You can capture CloudTrail logs in a specified S3 bucket for long-term analysis. To perform real-time analysis, you can configure CloudTrail to send logs to CloudWatch Logs.

For a trail that is enabled in all Regions in an account, CloudTrail sends log files from all of those Regions to a CloudWatch Logs log group.

This rule is covered by the [cloudtrail-cloudwatch-logs-group-arn-present](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudtrail/cloudtrail-cloudwatch-logs-group-arn-present.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - cloudtrail-cloudwatch-logs-group-arn-present.sentinel

    Description:
      This policy requires resources of type `aws_cloudtrail` to have cloudwatch log
      group arn set.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudtrail-cloudwatch-logs-group-arn-present.

    ✓ Found 0 resource violations

    cloudtrail-cloudwatch-logs-group-arn-present.sentinel:53:1 - Rule "main"
      Value:
        true

    cloudtrail-cloudwatch-logs-group-arn-present.sentinel:49:1 - Rule "ensure_cloudwatch_log_groups_arn_is_set"
      Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:
    Fail - cloudtrail-cloudwatch-logs-group-arn-present.sentinel

    Description:
      This policy requires resources of type `aws_cloudtrail` to have cloudwatch log for the policy cloudtrail-cloudwatch-logs-group-arn-present.
      group arn set.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed.

    Found 1 resource violations

    → Module name: root
       ↳ Resource Address: aws_cloudtrail.example
         | ✗ failed
         | Attribute 'cloud_watch_logs_group_arn' must be present for 'aws_cloudtrail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-5 for more details.


    cloudtrail-cloudwatch-logs-group-arn-present.sentinel:53:1 - Rule "main"
      Value:
        false

    cloudtrail-cloudwatch-logs-group-arn-present.sentinel:49:1 - Rule "ensure_cloudwatch_log_groups_arn_is_set"
      Value:
        false
```

---
