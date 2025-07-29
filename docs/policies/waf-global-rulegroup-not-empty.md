# AWS WAF Classic global rule groups should have at least one rule

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

This control checks whether an AWS WAF global rule group has at least one rule. The control fails if no rules are present within a rule group.

A WAF global rule group can contain multiple rules. The rule's conditions allow for traffic inspection and take a defined action (allow, block, or count). Without any rules, the traffic passes without inspection. A WAF global rule group with no rules, but with a name or tag suggesting allow, block, or count, could lead to the wrong assumption that one of those actions is occurring.

This rule is covered by the [waf-global-rulegroup-not-empty](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/waf-global-rulegroup-not-empty.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - waf-global-rulegroup-not-empty.sentinel

      Description:
        This policy requires resources of type `aws_waf_rule_group` to have at least
        one rule.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy waf-global-rulegroup-not-empty.

      ✓ Found 0 resource violations

      waf-global-rulegroup-not-empty.sentinel:44:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - waf-global-rulegroup-not-empty.sentinel

      Description:
        This policy requires resources of type `aws_waf_rule_group` to have at least
        one rule.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy waf-global-rulegroup-not-empty.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_waf_rule_group.example
          | ✗ failed
          | AWS WAF Classic global rule groups should have at least one rule. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-7 for more details.


      waf-global-rulegroup-not-empty.sentinel:44:1 - Rule "main"
        Value:
          false
```

---