# Service Catalog portfolios should be shared within an AWS organization only

| Provider            |          Category          |
| ------------------- |  ------------------------  |
| Amazon Web Services |  Secure Access Management  |

## Description

DISCLAIMER - This policy works when all resources of type aws_servicecatalog_portfolio and aws_servicecatalog_portfolio_share are present in the root module.

This control checks whether AWS Service Catalog shares portfolios within an organization when the integration with AWS Organizations is enabled. The control fails if portfolios aren't shared within an organization.

Portfolio sharing only within Organizations helps ensure that a portfolio isn't shared with incorrect AWS accounts. To share a Service Catalog portfolio with an account in an organization, Security Hub recommends using ORGANIZATION_MEMBER_ACCOUNT instead of ACCOUNT. 

This rule is covered by the [service-catalog-shared-within-organization](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/service-catalog-shared-within-organization.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - service-catalog-shared-within-organization.sentinel

        Description:
        This policy requires `aws_servicecatalog_portfolio_share` resources to have
        attribute 'type' should not be 'ACCOUNT'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy service-catalog-shared-within-organization.

        ✓ Found 0 resource violations

        service-catalog-shared-within-organization.sentinel:83:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - service-catalog-shared-within-organization.sentinel

        Description:
        This policy requires `aws_servicecatalog_portfolio_share` resources to have
        attribute 'type' should not be 'ACCOUNT'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy service-catalog-shared-within-organization.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_servicecatalog_portfolio.example
            | ✗ failed
            | Attribute 'type' must not be 'ACCOUNT' for 'aws_servicecatalog_portfolio_share' linked with the 'aws_servicecatalog_portfolio' resource. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/servicecatalog-controls.html#servicecatalog-1 for more details.


        service-catalog-shared-within-organization.sentinel:83:1 - Rule "main"
        Value:
            false
```

---
