# ActiveMQ brokers should use active/standby deployment mode

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Resilience      |

## Description

This control checks whether the deployment mode for an Amazon MQ ActiveMQ broker is set to active/standby. The control fails if a single-instance broker (enabled by default) is set as the deployment mode.

Active/standby deployment provides high availability for your Amazon MQ ActiveMQ brokers in an AWS Region. The active/standby deployment mode includes two broker instances in two different Availability Zones, configured in a redundant pair. These brokers communicate synchronously with your application, which can reduce downtime and loss of data in the event of a failure.

This rule is covered by the [activemq-brokers-should-use-active-standby-deployment-mode](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/mq/activemq-brokers-should-use-active-standby-deployment-mode.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - activemq-brokers-should-use-active-standby-deployment-mode.sentinel

      Description:
        This control checks whether the deployment mode for an Amazon MQ ActiveMQ
        broker is set to active/standby.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy activemq-brokers-should-use-active_standby-deployment-mode.

      ✓ Found 0 resource violations

      activemq-brokers-should-use-active-standby-deployment-mode.sentinel:46:1 - Rule "main"
        Value:
          true

```

---

## Policy Results (Fail)
```bash
trace:
      Fail - activemq-brokers-should-use-active-standby-deployment-mode.sentinel

      Description:
        This control checks whether the deployment mode for an Amazon MQ ActiveMQ
        broker is set to active/standby.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy activemq-brokers-should-use-active_standby-deployment-mode.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_mq_broker.example
          | ✗ failed
          | Amazon MQ brokers should use ACTIVE_STANDBY_MULTI_AZ or CLUSTER_MULTI_AZ deployment mode for high availability.


      activemq-brokers-should-use-active-standby-deployment-mode.sentinel:46:1 - Rule "main"
        Value:
          false
```

---