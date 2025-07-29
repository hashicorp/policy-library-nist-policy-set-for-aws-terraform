# Amazon EC2 Transit Gateways should not automatically accept VPC attachment requests

| Provider            |            Category            |
| ------------------- | ------------------------------ |
| Amazon Web Services |  Secure Network Configuration  |

## Description

This control checks if EC2 transit gateways are automatically accepting shared VPC attachments. This control fails for a transit gateway that automatically accepts shared VPC attachment requests.

Turning on AutoAcceptSharedAttachments configures a transit gateway to automatically accept any cross-account VPC attachment requests without verifying the request or the account the attachment is originating from. To follow the best practices of authorization and authentication, we recommended turning off this feature to ensure that only authorized VPC attachment requests are accepted.

This rule is covered by the [ec2-transit-gateway-auto-vpc-attach-disabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-transit-gateway-auto-vpc-attach-disabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-transit-gateway-auto-vpc-attach-disabled.sentinel

        Description:
        This policy checks if the EC2 Transit Gateway have the attribute
        'auto_accept_shared_attachments' set to disable

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-transit-gateway-auto-vpc-attach-disabled.

        ✓ Found 0 resource violations

        ec2-transit-gateway-auto-vpc-attach-disabled.sentinel:49:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-transit-gateway-auto-vpc-attach-disabled.sentinel

        Description:
        This policy checks if the EC2 Transit Gateway have the attribute
        'auto_accept_shared_attachments' set to disable

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-transit-gateway-auto-vpc-attach-disabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_ec2_transit_gateway.example
            | ✗ failed
            | Resource EC2 Transit Gateway should have the attribute 'auto_accept_shared_attachments' set to diable. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-23 for more details.


        ec2-transit-gateway-auto-vpc-attach-disabled.sentinel:49:1 - Rule "main"
        Value:
            false
```

---
