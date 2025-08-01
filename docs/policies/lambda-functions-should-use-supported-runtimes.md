# Lambda functions should use supported runtimes

| Provider            | Category           |
|---------------------|--------------------|
| Amazon Web Services | Secure development |

## Description

This control checks whether AWS Lambda function runtime settings match the expected values set for the supported runtimes in each language. The control fails if the Lambda function doesn't use a supported runtime, noted previously in the Parameters section. Security Hub ignores functions that have a package type of Image.

Lambda runtimes are built around a combination of operating system, programming language, and software libraries that are subject to maintenance and security updates. When a runtime component is no longer supported for security updates, Lambda deprecates the runtime. Even though you can't create functions that use the deprecated runtime, the function is still available to process invocation events. We recommend ensuring that your Lambda functions are current and don't use deprecated runtime environments. For a list of supported runtimes, see Lambda runtimes in the AWS Lambda Developer Guide.

This rule is covered by the [lambda-functions-should-use-supported-runtimes](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/lambda/lambda-functions-should-use-supported-runtimes.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - lambda-functions-should-use-supported-runtimes.sentinel

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy lambda-functions-should-use-supported-runtimes.

      ✓ Found 0 resource violations

      lambda-functions-should-use-supported-runtimes.sentinel:49:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - lambda-functions-should-use-supported-runtimes.sentinel

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy lambda-functions-should-use-supported-runtimes.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_lambda_function.test_lambda
          | ✗ failed
          | 'aws_lambda_function' runtime settings should match the expected values set for the supported runtimes in each language. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/lambda-controls.html#lambda-2 for more details.


      lambda-functions-should-use-supported-runtimes.sentinel:49:1 - Rule "main"
        Value:
          false
```

---