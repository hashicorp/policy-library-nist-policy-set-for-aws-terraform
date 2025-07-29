# SSM documents should not be public

| Provider            |           Category          |
| ------------------- |  -------------------------  |
| Amazon Web Services |  Secure network management  |

## Description

This control checks whether AWS Systems Manager documents that are owned by the account are public. This control fails if Systems Manager documents with the owner Self are public.

Systems Manager documents that are public might allow unintended access to your documents. A public Systems Manager document can expose valuable information about your account, resources, and internal processes.

This rule is covered by the [ssm-documents-should-not-be-public](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ssm-documents-should-not-be-public.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ssm-documents-should-not-be-public.sentinel

        Description:
        This policy requires resources of type `aws_ssm_document` to not be public.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ssm-document-not-public.

        ✓ Found 0 resource violations

        ssm-documents-should-not-be-public.sentinel:60:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ssm-documents-should-not-be-public.sentinel

        Description:
        This policy requires resources of type `aws_ssm_document` to not be public.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ssm-document-not-public.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_ssm_document.foo
            | ✗ failed
            | SSM documents should not be public. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ssm-controls.html#ssm-4 for more details.


        ssm-documents-should-not-be-public.sentinel:60:1 - Rule "main"
        Value:
            false
```

---
