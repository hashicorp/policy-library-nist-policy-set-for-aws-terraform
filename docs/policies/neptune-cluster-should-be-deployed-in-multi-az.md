# Neptune DB clusters should be deployed across multiple Availability Zones

| Provider            |       Category       |
| ------------------- |  ------------------  |
| Amazon Web Services |  High Availability   |

## Description

This control checks if an Amazon Neptune DB cluster has read-replica instances in multiple Availability Zones (AZs). The control fails if the cluster is deployed in only one AZ.

If an AZ is unavailable and during regular maintenance events, read-replicas serve as failover targets for the primary instance. That is, if the primary instance fails, Neptune promotes a read-replica instance to become the primary instance. By contrast, if your DB cluster doesn't include any read-replica instances, your DB cluster remains unavailable when the primary instance fails until it has been re-created. Re-creating the primary instance takes considerably longer than promoting a read-replica. To ensure high availability, we recommend that you create one or more read-replica instances that have the same DB instance class as the primary instance and are located in different AZs than the primary instance

This rule is covered by the [neptune-cluster-should-be-deployed-in-multi-az](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/neptune/neptune-cluster-should-be-deployed-in-multi-az.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - neptune-cluster-should-be-deployed-in-multi-az.sentinel

        Description:
        This policy requires neptune cluster to be deployed in multiple availability
        zone (multi-AZ) mode

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy neptune-cluster-should-be-deployed-in-multi-az.

        ✓ Found 0 resource violations

        neptune-cluster-should-be-deployed-in-multi-az.sentinel:48:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - neptune-cluster-should-be-deployed-in-multi-az.sentinel

        Description:
        This policy requires neptune cluster to be deployed in multiple availability
        zone (multi-AZ) mode

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy neptune-cluster-should-be-deployed-in-multi-az.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_neptune_cluster.new_cluster
            | ✗ failed
            | Attribute 'availability_zones' must be greater than or equal to 2 for 'aws_neptune_cluster' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/neptune-controls.html#neptune-9 for more details.


        neptune-cluster-should-be-deployed-in-multi-az.sentinel:48:1 - Rule "main"
        Value:
            false
```

---
