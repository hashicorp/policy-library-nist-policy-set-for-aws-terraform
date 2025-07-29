# VPCs should be configured with an interface endpoint for Systems Manager

| Provider            |             Category           |
| ------------------- |  ----------------------------  |
| Amazon Web Services |    Secure Access Management    |

## Description

DISCLAIMER - This policy works when all resources of type aws_vpc and aws_vpc_endpoint are present in the root module.

This control checks whether a virtual private cloud (VPC) that you manage has an interface VPC endpoint for AWS Systems Manager. The control fails if the VPC doesn't have an interface VPC endpoint for Systems Manager. This control evaluates resources in a single account.

AWS PrivateLink enables customers to access services hosted on AWS in a highly available and scalable manner, while keeping all the network traffic within the AWS network. Service users can privately access services powered by PrivateLink from their VPC or their on-premises, without using public IPs, and without requiring traffic to traverse across the internet.

This rule is covered by the [ec2-vpc-should-be-configured-for-interface-endpoint](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-vpc-should-be-configured-for-interface-endpoint.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-vpc-should-be-configured-for-interface-endpoint-for-systems-manager.sentinel

        Description:
        This policy requires resources of type `aws_vpc_endpoint` should have
        'vpc_endpoint_type' configured with interface endpoint and should be
        referenced to `aws_vpc` resource.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-vpc-should-be-configured-for-interface-endpoint.

        ✓ Found 0 resource violations

        ec2-vpc-should-be-configured-for-interface-endpoint-for-systems-manager.sentinel:112:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-vpc-should-be-configured-for-interface-endpoint-for-systems-manager.sentinel

        Description:
        This policy requires resources of type `aws_vpc_endpoint` should have
        'vpc_endpoint_type' configured with interface endpoint and should be
        referenced to `aws_vpc` resource.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-vpc-should-be-configured-for-interface-endpoint.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_vpc.main
            | ✗ failed
            | AWS EC2 VPC endpoints should be configured for interface endpoints. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-57 for more details.


        ec2-vpc-should-be-configured-for-interface-endpoint-for-systems-manager.sentinel:112:1 - Rule "main"
        Value:
            false
```

---
