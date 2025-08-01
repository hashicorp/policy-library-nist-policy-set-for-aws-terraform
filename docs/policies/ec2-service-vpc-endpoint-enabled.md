# Amazon EC2 should be configured to use VPC endpoints that are created for the Amazon EC2 service

| Provider            |             Category           |
| ------------------- |  ----------------------------  |
| Amazon Web Services |  Secure network configuration  |

## Description

DISCLAIMER - This policy works when all resources of type aws_vpc and aws_vpc_endpoint are present in the root module and 
have their `cidr_blocks`,`ipv6_cidr_blocks`,`cidr_ipv4` or `cidr_ipv6`  attributes set as a constant value.

This control checks whether a service endpoint for Amazon EC2 is created for each VPC. The control fails if a VPC does not have a VPC endpoint created for the Amazon EC2 service.

This control evaluates resources in single account. It cannot describe resources that are outside of the account. Because AWS Config and Security Hub do not conduct cross-account checks, you will see FAILED findings for VPCs that are shared across accounts. Security Hub recommends that you suppress these FAILED findings.

This rule is covered by the [ec2-service-vpc-endpoint-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-service-vpc-endpoint-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-service-vpc-endpoint-enabled.sentinel

        Description:
        This policy requires `aws_vpc_endpoint` resources to have attribute
        'vpc_endpoint_type' to be 'Interface' and 'service_name' to be 'ec2'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-service-vpc-endpoint-enabled.

        ✓ Found 0 resource violations

        ec2-service-vpc-endpoint-enabled.sentinel:91:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-service-vpc-endpoint-enabled.sentinel

        Description:
        This policy requires `aws_vpc_endpoint` resources to have attribute
        'vpc_endpoint_type' to be 'Interface' and 'service_name' to be 'ec2'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-service-vpc-endpoint-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_vpc.main
            | ✗ failed
            | Attribute 'vpc_endpoint_type' must be 'Interface' and 'service_name' to be 'ec2' for 'aws_vpc_endpoint' linked with the 'aws_vpc' resource. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-10 for more details.


        ec2-service-vpc-endpoint-enabled.sentinel:91:1 - Rule "main"
        Value:
            false
```

---
