# CloudFront distributions should have WAF enabled

| Provider            |       Category      |
|---------------------| --------------------|
| Amazon Web Services | Protective services |

## Description

DISCLAIMER - This policy works when all resources of type aws_cloudfront_distribution and aws_wafv2_web_acl are present in the root module.

This control checks whether CloudFront distributions are associated with either AWS WAF Classic or AWS WAF web ACLs. The control fails if the distribution is not associated with a web ACL.

AWS WAF is a web application firewall that helps protect web applications and APIs from attacks. It allows you to configure a set of rules, called a web access control list (web ACL), that allow, block, or count web requests based on customizable web security rules and conditions that you define. Ensure your CloudFront distribution is associated with an AWS WAF web ACL to help protect it from malicious attacks.

This rule is covered by the [cloudfront-associated-with-waf](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudfront/cloudfront-associated-with-waf.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - cloudfront-associated-with-waf.sentinel

    Description:
    This policy checks whether 'aws_cloudfront_distribution' are associated with
    either AWS WAF Classic or AWS WAF web ACLs.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudfront-associated-with-waf.

    ✓ Found 0 resource violations

    cloudfront-associated-with-waf.sentinel:56:1 - Rule "main"
    Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:
    Fail - cloudfront-associated-with-waf.sentinel

    Description:
    This policy checks whether 'aws_cloudfront_distribution' are associated with
    either AWS WAF Classic or AWS WAF web ACLs.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudfront-associated-with-waf.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_cloudfront_distribution.without_waf
        | ✗ failed
        | 'aws_cloudfront_distribution' are associated with either AWS WAF Classic or AWS WAF web ACLs. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudfront-controls.html#cloudfront-6 for more details.


    cloudfront-associated-with-waf.sentinel:56:1 - Rule "main"
    Value:
        false
        
```
---