# AWS WAF Classic Regional rule groups should have at least one rule

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

This control checks whether an AWS WAF Regional rule group has at least one rule. The control fails if no rules are present within a rule group.

A WAF Regional rule group can contain multiple rules. The rule's conditions allow for traffic inspection and take a defined action (allow, block, or count). Without any rules, the traffic passes without inspection. A WAF Regional rule group with no rules, but with a name or tag suggesting allow, block, or count, could lead to the wrong assumption that one of those actions is occurring.

This rule is covered by the [waf-regional-rulegroup-not-empty](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/waf-regional-rulegroup-not-empty.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - waf-regional-rulegroup-not-empty.sentinel

      Description:
        This policy checks whether an AWS WAF Regional rule group has at least one
        rule.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy waf-regional-rulegroup-not-empty.

      ✓ Found 0 resource violations

      waf-regional-rulegroup-not-empty.sentinel:48:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - waf-regional-rulegroup-not-empty.sentinel

      Description:
        This policy checks whether an AWS WAF Regional rule group has at least one
        rule.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy waf-regional-rulegroup-not-empty.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_wafregional_rule_group.example
          | ✗ failed
          | AWS WAF Regional rule group should have at least one rule. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-3 for more details.


      waf-regional-rulegroup-not-empty.sentinel:48:1 - Rule "main"
        Value:
          false
```

---