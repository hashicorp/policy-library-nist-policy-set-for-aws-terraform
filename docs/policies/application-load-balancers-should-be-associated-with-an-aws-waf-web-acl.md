# Application Load Balancers should be associated with an AWS WAF web ACL

| Provider            | Category            |
|---------------------|---------------------|
| Amazon Web Services | Protective services |

## Description

This control checks whether an API Gateway stage uses an AWS WAF web access control list (ACL). This control fails if an AWS WAF web ACL is not attached to a REST API Gateway stage.

AWS WAF is a web application firewall that helps protect web applications and APIs from attacks. It enables you to configure an ACL, which is a set of rules that allow, block, or count web requests based on customizable web security rules and conditions that you define. Ensure that your API Gateway stage is associated with an AWS WAF web ACL to help protect it from malicious attacks.

This rule is covered by the [application-load-balancers-should-be-associated-with-an-aws-waf-web-acl](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/elv/application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.sentinel

      Description:
        This control checks whether an Application Load Balancer is associated with an
        AWS WAF Classic or AWS WAF web access control list (web ACL)

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.

      ✓ Found 0 resource violations

      application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.sentinel:64:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.sentinel

      Description:
        This control checks whether an Application Load Balancer is associated with an
        AWS WAF Classic or AWS WAF web access control list (web ACL)

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_wafv2_web_acl_association.example
          | ✗ failed
          | This control checks whether an Application Load Balancer is associated with an AWS WAF Classic or AWS WAF web access control list (web ACL). Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/apigateway-controls.html#apigateway-4 for more details.


      application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.sentinel:64:1 - Rule "main"
        Value:
          false
```

---