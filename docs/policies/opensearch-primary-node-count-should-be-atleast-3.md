# OpenSearch domains should have at least three dedicated primary nodes

| Provider            |       Category       |
| ------------------- |  ------------------  |
| Amazon Web Services |  High Availability   |

## Description

This control checks whether an Amazon OpenSearch Service domain is configured with at least three dedicated primary nodes. The control fails if the domain has fewer than three dedicated primary nodes.

OpenSearch Service uses dedicated primary nodes to increase cluster stability. A dedicated primary node performs cluster management tasks, but doesn't hold data or respond to data upload requests. We recommend that you use multi-AZ with standby, which adds three dedicated primary nodes to each production OpenSearch domain.

This rule is covered by the [opensearch-primary-node-count-should-be-atleast-3](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/opensearch/opensearch-primary-node-count-should-be-atleast-3.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - opensearch-primary-node-count-should-be-atleast-3.sentinel

        Description:
        This policy checks if resources of type 'aws_opensearch_domain' have the
        'dedicated_master_enabled' set to true and 'dedicated_master_count' greater
        than or equal to 3
        in the 'cluster_config' block

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy opensearch-primary-node-count-should-be-atleast-3.

        ✓ Found 0 resource violations

        opensearch-primary-node-count-should-be-atleast-3.sentinel:63:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - opensearch-primary-node-count-should-be-atleast-3.sentinel

        Description:
        This policy checks if resources of type 'aws_opensearch_domain' have the
        'dedicated_master_enabled' set to true and 'dedicated_master_count' greater
        than or equal to 3
        in the 'cluster_config' block

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy opensearch-primary-node-count-should-be-atleast-3.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_opensearch_domain.example
            | ✗ failed
            | Attribute 'dedicated_master_enabled' should be true and 'dedicated_master_count' in 'cluster_config' should atleast 3 for AWS OpenSearch Domain. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/opensearch-controls.html#opensearch-11 for more details.


        opensearch-primary-node-count-should-be-atleast-3.sentinel:63:1 - Rule "main"
        Value:
            false
```

---
