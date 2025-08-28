# AWS WAF web ACL logging should be enabled

| Provider            |  Category |
| ------------------- |  -------  |
| Amazon Web Services |  Logging  |

## Description

DISCLAIMER - This policy works when all resources of type aws_wafv2_web_acl and aws_wafv2_web_acl_logging_configuration are present in the root module.

This control checks whether logging is activated for an AWS WAFV2 web access control list (web ACL). This control fails if logging is deactivated for the web ACL.

Logging maintains the reliability, availability, and performance of AWS WAF. In addition, logging is a business and compliance requirement in many organizations. By logging traffic that's analyzed by your web ACL, you can troubleshoot application behavior.

This rule is covered by the [wafv2-webacl-should-have-logging-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/wafv2-webacl-should-have-logging-enabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - wafv2-webacl-should-have-logging-enabled.sentinel

        Description:
        WAFv2 Web ACLs should have logging enabled

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy wafv2-webacl-should-have-logging-enabled.

        ✓ Found 0 resource violations

        wafv2-webacl-should-have-logging-enabled.sentinel:73:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - wafv2-webacl-should-have-logging-enabled.sentinel

        Description:
        WAFv2 Web ACLs should have logging enabled

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy wafv2-webacl-should-have-logging-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_wafv2_web_acl.example
            | ✗ failed
            | WAFv2 Web ACLs should have logging enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-11 for more details.


        wafv2-webacl-should-have-logging-enabled.sentinel:73:1 - Rule "main"
        Value:
            false
```

---
