# ActiveMQ brokers should stream audit logs to CloudWatch

| Provider            | Category |
| ------------------- | -------- |
| Amazon Web Services | Storage  |

## Description

This control checks whether an Amazon MQ ActiveMQ broker streams audit logs to Amazon CloudWatch Logs. The control fails if the broker doesn't stream audit logs to CloudWatch Logs.

By publishing ActiveMQ broker logs to CloudWatch Logs, you can create CloudWatch alarms and metrics that increase the visibility of security-related information

This rule is covered by the [mq-cloudwatch-audit-log-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/mq/mq-cloudwatch-audit-log-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - mq-cloudwatch-audit-log-enabled.sentinel

      Description:
        This policy checks if resources of type 'aws_mq_broker' have the attribute
        'logs' with parameter
        'audit' set to true

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy mq-cloudwatch-audit-log-enabled.

      ✓ Found 0 resource violations

      mq-cloudwatch-audit-log-enabled.sentinel:52:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - mq-cloudwatch-audit-log-enabled.sentinel

      Description:
        This policy checks if resources of type 'aws_mq_broker' have the attribute
        'logs' with parameter
        'audit' set to true

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy mq-cloudwatch-audit-log-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_mq_broker.example
          | ✗ failed
          | Attribute 'logs' with parameter 'audit' should be true for AWS ActiveMQ Broker. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/mq-controls.html#mq-2 for more details.


      mq-cloudwatch-audit-log-enabled.sentinel:52:1 - Rule "main"
        Value:
          false
```

---