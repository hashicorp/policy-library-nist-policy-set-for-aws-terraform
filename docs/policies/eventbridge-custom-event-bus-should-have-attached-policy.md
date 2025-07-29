# EventBridge custom event buses should have a resource-based policy attached

| Provider            |           Category          |
| ------------------- |  -------------------------  |
| Amazon Web Services |  Secure network management  |

## Description

DISCLAIMER - This policy works when all resources of type aws_cloudwatch_event_bus and aws_cloudwatch_event_bus_policy are present in the root module.

This control checks if an Amazon EventBridge custom event bus has a resource-based policy attached. This control fails if the custom event bus doesn't have a resource-based policy.

By default, an EventBridge custom event bus doesn't have a resource-based policy attached. This allows principals in the account to access the event bus. By attaching a resource-based policy to the event bus, you can limit access to the event bus to specified accounts, as well as intentionally grant access to entities in another account.

This rule is covered by the [eventbridge-custom-event-bus-should-have-attached-policy](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/eventbridge-custom-event-bus-should-have-attached-policy.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - eventbridge-custom-event-bus-should-have-attached-policy.sentinel

        Description:
        This policy requires `aws_cloudwatch_event_bus` resources to be attached to a
        policy.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy eventbridge-custom-event-bus-should-have-attached-policy.

        ✓ Found 0 resource violations

        eventbridge-custom-event-bus-should-have-attached-policy.sentinel:71:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - eventbridge-custom-event-bus-should-have-attached-policy.sentinel

        Description:
        This policy requires `aws_cloudwatch_event_bus` resources to be attached to a
        policy.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy eventbridge-custom-event-bus-should-have-attached-policy.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_cloudwatch_event_bus.example
            | ✗ failed
            | Policy should be attached for 'aws_cloudwatch_event_bus' resource. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/eventbridge-controls.html#eventbridge-3 for more details.


        eventbridge-custom-event-bus-should-have-attached-policy.sentinel:71:1 - Rule "main"
        Value:
            false
```

---
