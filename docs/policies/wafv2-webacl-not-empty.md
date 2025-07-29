# AWS WAF web ACLs should have at least one rule or rule group

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

This control checks whether an AWS WAFV2 web access control list (web ACL) contains at least one rule or rule group. The control fails if a web ACL does not contain any rules or rule groups.

A web ACL gives you fine-grained control over all of the HTTP(S) web requests that your protected resource responds to. A web ACL should contain a collection of rules and rule groups that inspect and control web requests. If a web ACL is empty, the web traffic can pass without being detected or acted upon by AWS WAF depending on the default action.

This rule is covered by the [wafv2-webacl-not-empty](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/wafv2-webacl-not-empty.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - wafv2-webacl-not-empty.sentinel

      Description:
        This policy requires resources of type `aws_wafv2_web_acl` to have at least
        one rule or rule group.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy wafv2-webacl-not-empty.

      ✓ Found 0 resource violations

      wafv2-webacl-not-empty.sentinel:51:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - wafv2-webacl-not-empty.sentinel

      Description:
        This policy requires resources of type `aws_wafv2_web_acl` to have at least
        one rule or rule group.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy wafv2-webacl-not-empty.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_wafv2_web_acl.example
          | ✗ failed
          | AWS WAF web ACLs should have at least one rule or rule group. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-10 for more details.


      wafv2-webacl-not-empty.sentinel:51:1 - Rule "main"
        Value:
          false
```

---