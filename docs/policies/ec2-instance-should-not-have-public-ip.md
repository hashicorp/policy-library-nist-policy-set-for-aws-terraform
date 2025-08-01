# Amazon EC2 instances should not have a public IPv4 address

| Provider            |             Category           |
| ------------------- |  ----------------------------  |
| Amazon Web Services |  Secure network configuration  |

## Description

This control checks whether EC2 instances have a public IP address. The control fails if the publicIp field is present in the EC2 instance configuration item. This control applies to IPv4 addresses only.

A public IPv4 address is an IP address that is reachable from the internet. If you launch your instance with a public IP address, then your EC2 instance is reachable from the internet. A private IPv4 address is an IP address that is not reachable from the internet. You can use private IPv4 addresses for communication between EC2 instances in the same VPC or in your connected private network.

This rule is covered by the [ec2-instance-should-not-have-public-ip](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-instance-should-not-have-public-ip.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-instance-should-not-have-public-ip.sentinel

        Description:
        This policy requires resources of type `aws_instance` to not have a public IP
        address.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-instance-should-not-have-public-ip.

        ✓ Found 0 resource violations

        ec2-instance-should-not-have-public-ip.sentinel:44:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-instance-should-not-have-public-ip.sentinel

        Description:
        This policy requires resources of type `aws_instance` to not have a public IP
        address.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-instance-should-not-have-public-ip.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_instance.this
            | ✗ failed
            | EC2 instances should not have a public IP address. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-9 for more details.


        ec2-instance-should-not-have-public-ip.sentinel:44:1 - Rule "main"
        Value:
            false
```

---
