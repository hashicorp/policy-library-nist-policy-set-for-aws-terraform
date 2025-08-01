# AWS WAF Classic Global Web ACL logging should be enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks whether logging is enabled for an AWS WAF global web ACL. This control fails if logging is not enabled for the web ACL.

Logging is an important part of maintaining the reliability, availability, and performance of AWS WAF globally. It is a business and compliance requirement in many organizations, and allows you to troubleshoot application behavior. It also provides detailed information about the traffic that is analyzed by the web ACL that is attached to AWS WAF.

This rule is covered by the [waf-classic-logging-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/waf-classic-logging-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - waf-classic-logging-enabled.sentinel

      Description:
        This policy checks whether logging is enabled for an 'aws_waf_web_acl'.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy waf-classic-logging-enabled.

      ✓ Found 0 resource violations

      waf-classic-logging-enabled.sentinel:49:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - waf-classic-logging-enabled.sentinel

      Description:
        This policy checks whether logging is enabled for an 'aws_waf_web_acl'.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy waf-classic-logging-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_waf_web_acl.example
          | ✗ failed
          | Logging should be enabled for an AWS WAF global web ACL. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-1 for more details.


      waf-classic-logging-enabled.sentinel:49:1 - Rule "main"
        Value:
          false
```

---