#  Amazon EMR security configurations should be encrypted at rest

| Provider            | Category             |
|---------------------|----------------------|
| Amazon Web Services | Data Protection      |

## Description

This control checks whether an Amazon EMR security configuration has encryption at rest enabled. The control fails if the security configuration doesn't enable encryption at rest.

Data at rest refers to data that's stored in persistent, non-volatile storage for any duration. Encrypting data at rest helps you protect its confidentiality, which reduces the risk that an unauthorized user can access it.

This rule is covered by the [emr-security-configuration-encryption-rest](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/emr/emr-security-configuration-encryption-rest.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - emr-security-configuration-encryption-rest.sentinel

    Description:
    This policy requires 'aws_emr_security_configuration' to include at-rest
    encryption settings.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy emr-security-configuration-encryption-rest.

    ✓ Found 0 resource violations

    emr-security-configuration-encryption-rest.sentinel:65:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - emr-security-configuration-encryption-rest.sentinel

    Description:
    This policy requires 'aws_emr_security_configuration' to include at-rest
    encryption settings.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy emr-security-configuration-encryption-rest.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_emr_security_configuration.fail_config
        | ✗ failed
        | Amazon EMR security configurations must include encryption at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/emr-controls.html#emr-3 for more details.


    emr-security-configuration-encryption-rest.sentinel:65:1 - Rule "main"
    Value:
        false
```

---