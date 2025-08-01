# VPC Lambda functions should operate in multiple Availability Zones

| Provider            | Category          |
|---------------------|-------------------|
| Amazon Web Services | High availability |

## Description

DISCLAIMER - This policy works when all resources of type aws_lambda_function and aws_subnet to be in the root module.

This control checks if an AWS Lambda function that connects to a virtual private cloud (VPC) operates in at least the specified number of Availability Zone (AZs). The control fails if the function doesn't operate in at least the specified number of AZs. Unless you provide a custom parameter value for the minimum number of AZs, Security Hub uses a default value of two AZs.

Deploying resources across multiple AZs is an AWS best practice to ensure high availability within your architecture. Availability is a core pillar in the confidentiality, integrity, and availability triad security model. All Lambda functions that connect to a VPC should have a multi-AZ deployment to ensure that a single zone of failure doesn't cause a total disruption of operations.

This rule is covered by the [lambda-vpc-multi-az-check](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/lambda/lambda-vpc-multi-az-check.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - lambda-vpc-multi-az-check.sentinel

      Description:
        This policy if an 'aws_lambda_function' that connects to a virtual private
        cloud (VPC) operates in at least the specified number of Availability Zone
        (AZs)

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy lambda-vpc-multi-az-check.

      ✓ Found 0 resource violations

      lambda-vpc-multi-az-check.sentinel:52:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - lambda-vpc-multi-az-check.sentinel

      Description:
        This policy if an 'aws_lambda_function' that connects to a virtual private
        cloud (VPC) operates in at least the specified number of Availability Zone
        (AZs)

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy lambda-vpc-multi-az-check.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_lambda_function.vpc_lambda
          | ✗ failed
          | AWS Lambda function that connects to a virtual private cloud (VPC) operates in at least the specified number of Availability Zone (AZs). Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-5 for more details.


      lambda-vpc-multi-az-check.sentinel:52:1 - Rule "main"
        Value:
          false
```

---