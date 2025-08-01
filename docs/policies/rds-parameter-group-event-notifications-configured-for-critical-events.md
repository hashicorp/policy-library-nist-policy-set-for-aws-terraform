# AWS Event Subscriptions should have Event Notifications configured for the AWS RDS Parameter Group resource

| Provider            |        Category         |
| ------------------- |      ------------       |
| Amazon Web Services |  Application Monitoring |

## Description

This control checks whether an Amazon RDS event subscription exists with notifications enabled for the following source type, event category key-value pairs. The control passes if there are no existing event subscriptions in your account.

DBParameterGroup: ["configuration change"]

RDS event notifications use Amazon SNS to make you aware of changes in the availability or configuration of your RDS resources. These notifications allow for rapid response. For additional information about RDS event notifications, see Using Amazon RDS event notification in the Amazon RDS User Guide.

This rule is covered by the [rds-event-notifications-configured-for-critical-events](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/rds/rds-event-notifications-configured-for-critical-events.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - rds-parameter-group-event-notifications-configured-for-critical-events.sentinel

        Description:
        This policy checks if resources of type 'aws_event_subscription' have the
        event notifications
        configured

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy rds-event-notifications-configured-for-critical-events.

        ✓ Found 0 resource violations

        rds-parameter-group-event-notifications-configured-for-critical-events.sentinel:110:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - rds-parameter-group-event-notifications-configured-for-critical-events.sentinel

        Description:
        This policy checks if resources of type 'aws_event_subscription' have the
        event notifications
        configured

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy rds-event-notifications-configured-for-critical-events.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_rds_cluster_parameter_group.default
            | ✗ failed
            | Event Notifications should be configured for the resource critical events, Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-21 for more details.


        rds-parameter-group-event-notifications-configured-for-critical-events.sentinel:110:1 - Rule "main"
        Value:
            false
```

---
