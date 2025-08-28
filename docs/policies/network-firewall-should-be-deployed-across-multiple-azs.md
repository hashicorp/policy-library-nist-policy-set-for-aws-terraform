# Network Firewall firewalls should be deployed across multiple Availability Zones

| Provider            |       Category       |
| ------------------- |  ------------------  |
| Amazon Web Services |  High Availability   |

## Description

This control evaluates whether a firewall managed through AWS Network Firewall is deployed across multiple Availability Zones (AZs). The control fails if a firewall is deployed in only one AZ.

AWS global infrastructure includes multiple AWS Regions. AZs are physically separated, isolated locations within each Region that are connected by low-latency, high-throughput, and highly redundant networking. By deploying a Network Firewall firewall across multiple AZs, you can balance and shift traffic among AZs, which helps you design highly available solutions.

This rule is covered by the [network-firewall-should-be-deployed-across-multiple-azs](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/network-firewall/network-firewall-should-be-deployed-across-multiple-azs.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - network-firewall-should-be-deployed-across-multiple-azs.sentinel

        Description:
        This policy checks whether a resource 'aws_networkfirewall_firewall' has been
        deployed across multiple availability zones.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy network-firewall-should-be-deployed-across-multiple-azs.

        ✓ Found 0 resource violations

        network-firewall-should-be-deployed-across-multiple-azs.sentinel:51:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - network-firewall-should-be-deployed-across-multiple-azs.sentinel

        Description:
        This policy checks whether a resource 'aws_networkfirewall_firewall' has been
        deployed across multiple availability zones.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy network-firewall-should-be-deployed-across-multiple-azs.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_networkfirewall_firewall.example
            | ✗ failed
            | Resource 'aws_networkfirewall_firewall' should be deployed across multiple availability zones. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/networkfirewall-controls.html#networkfirewall-1 for more details.


        network-firewall-should-be-deployed-across-multiple-azs.sentinel:51:1 - Rule "main"
        Value:
            false
```

---
