# Elasticsearch domains should have at least three data nodes

| Provider            |       Category      |
| ------------------- |  -----------------  |
| Amazon Web Services |  High Availability  |

## Description

This control checks whether Elasticsearch domains are configured with at least three data nodes and zoneAwarenessEnabled is true.

An Elasticsearch domain requires at least three data nodes for high availability and fault-tolerance. Deploying an Elasticsearch domain with at least three data nodes ensures cluster operations if a node fails.

This rule is covered by the [elasticsearch-domains-should-have-atleast-three-data-nodes](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/elasticsearch-domains-should-have-atleast-three-data-nodes.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - elasticsearch-domains-should-have-atleast-three-data-nodes.sentinel

        Description:
        This policy requires resources of type `aws_elasticsearch_domain` to have at
        least three data nodes and zone awareness enabled.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy elasticsearch-domain-node-count-and-zone-awareness.

        ✓ Found 0 resource violations

        elasticsearch-domains-should-have-atleast-three-data-nodes.sentinel:56:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - elasticsearch-domains-should-have-atleast-three-data-nodes.sentinel

        Description:
        This policy requires resources of type `aws_elasticsearch_domain` to have at
        least three data nodes and zone awareness enabled.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy elasticsearch-domain-node-count-and-zone-awareness.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_elasticsearch_domain.example
            | ✗ failed
            | Elasticsearch domains should have at least three data nodes and zone awareness enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/es-controls.html#es-6 for more details.


        elasticsearch-domains-should-have-atleast-three-data-nodes.sentinel:56:1 - Rule "main"
        Value:
            false
```

---
