# EventBridge global endpoints should have event replication enabled

| Provider            |           Category          |
| ------------------- |  -------------------------  |
| Amazon Web Services |  Resilience |

## Description

This control checks if event replication is enabled for an Amazon EventBridge global endpoint. The control fails if event replication isn't enabled for a global endpoint.

Global endpoints help make your application Regional-fault tolerant. To start, you assign an Amazon Route 53 health check to the endpoint. When failover is initiated, the health check reports an "unhealthy" state. Within minutes of failover initiation, all custom events are routed to an event bus in the secondary Region and are processed by that event bus. When you use global endpoints, you can enable event replication. Event replication sends all custom events to the event buses in the primary and secondary Regions using managed rules. We recommend enabling event replication when setting up global endpoints. Event replication helps you verify that your global endpoints are configured correctly. Event replication is required to automatically recover from a failover event. If you don’t have event replication enabled, you’ll have to manually reset the Route 53 health check to "healthy" before events are rerouted back to the primary Region.

This rule is covered by the [eventbridge-global-endpoints-should-have-event-replication-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/eventbridge/eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel

        Description:
        EventBridge.4
        This control checks if event replication is enabled for an Amazon EventBridge
        global endpoint.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy eventbridge-global-endpoints-should-have-event-replication-enabled.

        ✓ Found 0 resource violations

        eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel:58:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel

        Description:
        This control checks if event replication is enabled for an Amazon EventBridge
        global endpoint.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy eventbridge-global-endpoints-should-have-event-replication-enabled.

        Found 1 resource violations

        → Module name: root
            ↳ Resource Address: aws_cloudwatch_event_endpoint.missing_replication_endpoint
                | ✗ failed
                | EventBridge Global Endpoints should have event replication enabled. Set 'replication_config.state' to 'ENABLED'.


        eventbridge-global-endpoints-should-have-event-replication-enabled.sentinel:58:1 - Rule "main"
        Value:
            false
```

---
