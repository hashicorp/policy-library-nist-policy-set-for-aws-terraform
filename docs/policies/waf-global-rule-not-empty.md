# AWS WAF Classic global rules should have at least one condition

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

This control checks whether an AWS WAF global rule contains any conditions. The control fails if no conditions are present within a rule.

A WAF global rule can contain multiple conditions. A rule's conditions allow for traffic inspection and take a defined action (allow, block, or count). Without any conditions, the traffic passes without inspection. A WAF global rule with no conditions, but with a name or tag suggesting allow, block, or count, could lead to the wrong assumption that one of those actions is occurring.

This rule is covered by the [waf-global-rule-not-empty](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/waf-global-rule-not-empty.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - waf-global-rule-not-empty.sentinel

      Description:
        This policy requires resources of type `aws_waf_rule` to have at least one
        predicate.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy waf-global-rule-not-empty.

      ✓ Found 0 resource violations

      waf-global-rule-not-empty.sentinel:45:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - waf-global-rule-not-empty.sentinel

      Description:
        This policy requires resources of type `aws_waf_rule` to have at least one
        predicate.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy waf-global-rule-not-empty.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_waf_rule.wafrule
          | ✗ failed
          | AWS WAF Classic global rules should have at least one condition. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-6 for more details.


      waf-global-rule-not-empty.sentinel:45:1 - Rule "main"
        Value:
          false
```

---