# AWS WAF rules should have CloudWatch metrics enabled

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Logging      |

## Description

This control checks whether an AWS WAF rule or rule group has Amazon CloudWatch metrics enabled. The control fails if the rule or rule group doesn't have CloudWatch metrics enabled.

Configuring CloudWatch metrics on AWS WAF rules and rule groups provides visibility into traffic flow. You can see which ACL rules are triggered and which requests are accepted and blocked. This visibility can help you identify malicious activity on your associated resources.

This rule is covered by the [wafv2-rulegroup-logging-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/waf/wafv2-rulegroup-logging-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - wafv2-rulegroup-logging-enabled.sentinel

      Description:
        This policy requires resources of type `aws_wafv2_rule_group` have attribute
        'cloudwatch_metrics_enabled' set to true.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy wafv2-rulegroup-logging-enabled.

      ✓ Found 0 resource violations

      wafv2-rulegroup-logging-enabled.sentinel:49:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - wafv2-rulegroup-logging-enabled.sentinel

      Description:
        This policy requires resources of type `aws_wafv2_rule_group` have attribute
        'cloudwatch_metrics_enabled' set to true.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy wafv2-rulegroup-logging-enabled.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_wafv2_rule_group.example
          | ✗ failed
          | Attribute 'visibility_config.cloudwatch_metrics_enabled' must be set to true for 'aws_wafv2_rule_group' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/waf-controls.html#waf-12 for more details.


      wafv2-rulegroup-logging-enabled.sentinel:49:1 - Rule "main"
        Value:
          false
```

---