# Lambda function policies should prohibit public access

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

This control checks whether the Lambda function resource-based policy prohibits public access outside of your account. The control fails if public access is permitted. The control also fails if a Lambda function is invoked from Amazon S3, and the policy doesn't include a condition to limit public access, such as AWS:SourceAccount. We recommend using other S3 conditions along with AWS:SourceAccount in your bucket policy for more refined access.

The Lambda function should not be publicly accessible, as this may allow unintended access to your function code.

This rule is covered by the [lambda-function-public-access-prohibited](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/lambda/lambda-function-public-access-prohibited.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - lambda-function-public-access-prohibited.sentinel

      Description:
        This control checks whether the 'aws_lambda_function' resource-based policy
        prohibits public access outside of your account.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy lambda-function-public-access-prohibited.

      ✓ Found 0 resource violations

      lambda-function-public-access-prohibited.sentinel:47:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - lambda-function-public-access-prohibited.sentinel

      Description:
        This control checks whether the 'aws_lambda_function' resource-based policy
        prohibits public access outside of your account.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy lambda-function-public-access-prohibited.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_lambda_permission.secure_permission
          | ✗ failed
          | 'aws_lambda_function' resource-based policy should prohibits public access outside of your account. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-1 for more details.


      lambda-function-public-access-prohibited.sentinel:47:1 - Rule "main"
        Value:
          false
```

---