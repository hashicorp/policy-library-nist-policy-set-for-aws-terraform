# MSK clusters should have enhanced monitoring configured

| Provider            |       Category       |
| ------------------- |  ------------------  |
| Amazon Web Services |  Detection Services  |

## Description

This control checks whether an Amazon MSK cluster has enhanced monitoring configured, specified by a monitoring level of at least PER_TOPIC_PER_BROKER. The control fails if the monitoring level for the cluster is set to DEFAULT or PER_BROKER.

The PER_TOPIC_PER_BROKER monitoring level provides more granular insights into the performance of your MSK cluster, and also provides metrics related to resource utilization, such as CPU and memory usage. This helps you identify performance bottlenecks and resource utilization patterns for individual topics and brokers. This visibility, in turn, can optimize the performance of your Kafka brokers.

This rule is covered by the [msk-clusters-should-have-enhanced-monitoring-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/msk/msk-clusters-should-have-enhanced-monitoring-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - msk-clusters-should-have-enhanced-monitoring-enabled.sentinel

        Description:
        This policy checks if resources of type 'aws_msk_cluster' have the 'enhanced
        monitoring' should
        be not set to 'DEFAULT' or 'PER_BROKER' in the monitoring configuration.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy msk-clusters-should-have-enhanced-monitoring-enabled.

        ✓ Found 0 resource violations

        msk-clusters-should-have-enhanced-monitoring-enabled.sentinel:48:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - msk-clusters-should-have-enhanced-monitoring-enabled.sentinel

        Description:
        This policy checks if resources of type 'aws_msk_cluster' have the 'enhanced
        monitoring' should
        be not set to 'DEFAULT' or 'PER_BROKER' in the monitoring configuration.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy msk-clusters-should-have-enhanced-monitoring-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_msk_cluster.example
            | ✗ failed
            | Attribute 'enhanced monitoring' should not be set to 'DEFAULT' or 'PER_BROKER' in the monitoring configuration for AWS MSK Cluster. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/msk-controls.html#msk-2 for more details.


        msk-clusters-should-have-enhanced-monitoring-enabled.sentinel:48:1 - Rule "main"
        Value:
            false
```

---
