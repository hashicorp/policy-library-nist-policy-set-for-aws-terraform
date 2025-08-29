# CloudWatch alarms should have specified actions configured

| Provider            | Category  |
|---------------------|-----------|
| Amazon Web Services | Detection services   |

## Description

DISCLAIMER - This policy works when all resources of type aws_cloudwatch_metric_alarm and aws_cloudwatch_composite_alarm are present in the root module.

This control checks whether an Amazon CloudWatch alarm has at least one action configured for the ALARM state. The control fails if the alarm doesn't have an action configured for the ALARM state. Optionally, you can include custom parameter values to also require alarm actions for the INSUFFICIENT_DATA or OK states.

This control focuses on whether a CloudWatch alarm has an alarm action configured, whereas CloudWatch.17 focuses on the activation status of a CloudWatch alarm action.

We recommend CloudWatch alarm actions to automatically alert you when a monitored metric is outside the defined threshold. Monitoring alarms help you identify unusual activities and quickly respond to security and operational issues when an alarm goes into a specific state. The most common type of alarm action is to notify one or more users by sending a message to an Amazon Simple Notification Service (Amazon SNS) topic.

This rule is covered by the [cloudwatch-alarms-should-have-specified-actions-configured](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudwatch/cloudwatch-alarms-should-have-specified-actions-configured.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
        Pass - cloudwatch-alarms-should-have-specified-actions-configured.sentinel

        Description:
          This control checks whether an Amazon CloudWatch alarm has at least one action
          configured for the ALARM state.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy cloudwatch-alarms-should-have-specified-actions-configured.

        ✓ Found 0 resource violations

        cloudwatch-alarms-should-have-specified-actions-configured.sentinel:61:1 - Rule "main"
          Description:
            Rules

          Value:
            true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - cloudwatch-alarms-should-have-specified-actions-configured.sentinel

      Description:
        This control checks whether an Amazon CloudWatch alarm has at least one action
        configured for the ALARM state.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudwatch-alarms-should-have-specified-actions-configured.

      Found 2 resource violations

      → Module name: root
        ↳ Resource Address: aws_cloudwatch_metric_alarm.metric_alarm
          | ✗ failed
          | CloudWatch alarms must have alarm actions configured. Refer to AWS security best practices for more details.

      cloudwatch-alarms-should-have-specified-actions-configured.sentinel:61:1 - Rule "main"
        Description:
          Rules

        Value:
          false
```

---