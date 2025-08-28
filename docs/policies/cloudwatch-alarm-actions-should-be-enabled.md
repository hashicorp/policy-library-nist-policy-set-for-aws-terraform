# CloudWatch alarm actions should be activated

| Provider            | Category        |
|---------------------|-----------------|
| Amazon Web Services | Detection services |

## Description

This control checks whether CloudWatch alarm actions are activated (ActionEnabled should be set to true). The control fails if the alarm action for a CloudWatch alarm is deactivated.

This control focuses on the activation status of a CloudWatch alarm action, whereas CloudWatch.15 focuses on whether any ALARM action is configured in a CloudWatch alarm.

Alarm actions automatically alert you when a monitored metric is outside the defined threshold. If the alarm action is deactivated, no actions are run when the alarm changes state, and you won't be alerted to changes in monitored metrics. We recommend activating CloudWatch alarm actions to help you quickly respond to security and operational issues.

This rule is covered by the [cloudwatch-alarm-actions-should-be-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudwatch/cloudwatch-alarm-actions-should-be-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - cloudwatch-alarm-actions-should-be-enabled.sentinel

      Description:
      This control checks whether CloudWatch alarm actions are activated
      (ActionEnabled should be set to true).

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudwatch-alarm-actions-should-be-enabled.

      ✓ Found 0 resource violations

      cloudwatch-alarm-actions-should-be-enabled.sentinel:54:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudwatch-alarm-actions-should-be-enabled.sentinel

      Description:
        This control checks whether CloudWatch alarm actions are activated
        (ActionEnabled should be set to true).

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudwatch-alarm-actions-should-be-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudwatch_metric_alarm.compliant_metric_alarm_2
          | ✗ failed
          | CloudWatch alarms should have actions enabled. Refer to AWS security best practices for more details.


      cloudwatch-alarm-actions-should-be-enabled.sentinel:54:1 - Rule "main"
        Value:
          false
```

---