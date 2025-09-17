# Network Firewall firewalls should have subnet change protection enabled

| Provider            | Category          |
|---------------------|------------------ |
| Amazon Web Services | Network Security  |

## Description

This control checks whether subnet change protection is enabled for an AWS Network Firewall firewall. The control fails if subnet change protection isn't enabled for the firewall.

AWS Network Firewall is a stateful, managed network firewall and intrusion detection service that you can use to inspect and filter traffic to, from, or between your Virtual Private Clouds (VPCs). If you enable subnet change protection for a Network Firewall firewall, you can protect the firewall against accidental changes to the firewall's subnet associations.

This rule is covered by the [network-firewall-subnet-change-protection-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/networkfirewall/network-firewall-subnet-change-protection-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - network-firewall-subnet-change-protection-enabled.sentinel

    Description:
    This policy requires resources of type `aws_networkfirewall_firewall` have
    attribute "subnet_change_protection" set to true.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy network-firewall-subnet-change-protection-enabled.

    ✓ Found 0 resource violations

    network-firewall-subnet-change-protection-enabled.sentinel:48:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - network-firewall-subnet-change-protection-enabled.sentinel

    Description:
    This policy requires resources of type `aws_networkfirewall_firewall` have
    attribute "subnet_change_protection" set to true.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy network-firewall-subnet-change-protection-enabled.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_networkfirewall_firewall.secure_firewall
        | ✗ failed
        | Attribute 'subnet_change_protection' must be set to true for 'aws_networkfirewall_firewall' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/networkfirewall-controls.html#networkfirewall-10 for more details.


    network-firewall-subnet-change-protection-enabled.sentinel:48:1 - Rule "main"
    Value:
        false
```

---