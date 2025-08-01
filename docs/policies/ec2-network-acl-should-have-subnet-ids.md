# Unused Network Access Control Lists should be removed

| Provider            |     Category     |
|---------------------| ---------------- |
| Amazon Web Services | Network Security |

## Description

DISCLAIMER - This policy works when all resources of type aws_network_acl, aws_network_acl_association and aws_subnet are present in the root module.

This control checks whether there are any unused network access control lists (network ACLs) in your virtual private cloud (VPC). The control fails if the network ACL isn't associated with a subnet. The control doesn't generate findings for an unused default network ACL.

The control checks the item configuration of the resource AWS::EC2::NetworkAcl and determines the relationships of the network ACL.

If the only relationship is the VPC of the network ACL, the control fails.

If other relationships are listed, then the control passes.

This rule is covered by the [ec2-network-acl-should-have-subnet-ids](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-network-acl-should-have-subnet-ids.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - ec2-network-acl-should-have-subnet-ids.sentinel

    Description:
    This policy requires `aws_network_acl` resources to have 'subnet_ids' present.

    Print messages:

    {"references": ["aws_subnet.main.id" "aws_subnet.main"]}
    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-network-acl-should-have-subnet-ids.

    ✓ Found 0 resource violations

    ec2-network-acl-should-have-subnet-ids.sentinel:89:1 - Rule "main"
    Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:

    Fail - ec2-network-acl-should-have-subnet-ids.sentinel

    Description:
    This policy requires `aws_network_acl` resources to have 'subnet_ids' present.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-network-acl-should-have-subnet-ids.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_network_acl.main
        | ✗ failed
        | Attribute 'subnet_ids' must be present for 'aws_network_acl' resources or it should include 'subnet_ids' through 'aws_network_acl_association'. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-16 for more details.


    ec2-network-acl-should-have-subnet-ids.sentinel:89:1 - Rule "main"
    Value:
        false
        
```
---