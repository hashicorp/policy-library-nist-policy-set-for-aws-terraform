# Lambda functions should be in a VPC

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

This control checks whether a Lambda function is deployed in a virtual private cloud (VPC). The control fails if the Lambda function isn't deployed in a VPC. Security Hub doesn't evaluate the VPC subnet routing configuration to determine public reachability. You might see failed findings for Lambda@Edge resources.

Deploying resources in a VPC strengthens security and control over network configurations. Such deployments also offer scalability and high fault tolerance across multiple Availability Zones. You can customize VPC deployments to meet diverse application requirements.

This rule is covered by the [lambda-functions-should-be-in-a-vpc](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/lambda/lambda-functions-should-be-in-a-vpc.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - lambda-functions-should-be-in-a-vpc.sentinel

    Description:
      This control checks whether a Lambda function is deployed in a virtual private
      cloud (VPC).

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy lambda-functions-should-be-in-a-vpc.

    ✓ Found 0 resource violations

    lambda-functions-should-be-in-a-vpc.sentinel:75:1 - Rule "main"
      Description:
        Rules

      Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - lambda-functions-should-be-in-a-vpc.sentinel

    Description:
      This control checks whether a Lambda function is deployed in a virtual private
      cloud (VPC).

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy lambda-functions-should-be-in-a-vpc.

    Found 1 resource violations

    → Module name: root
      ↳ Resource Address: aws_lambda_function.compliant_function
        | ✗ failed
        | Lambda functions must be deployed within a VPC with proper subnet_ids and security_group_ids configured.


    lambda-functions-should-be-in-a-vpc.sentinel:75:1 - Rule "main"
      Description:
        Rules

      Value:
        false
```

---