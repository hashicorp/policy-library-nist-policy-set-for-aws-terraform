# Amazon EMR security configurations should be encrypted in transit

| Provider            | Category             |
|---------------------|----------------------|
| Amazon Web Services | Data Protection      |

## Description

This control checks whether an Amazon EMR security configuration has encryption in transit enabled. The control fails if the security configuration doesn't enable encryption in transit.

Data in transit refers to data that moves from one location to another, such as between nodes in your cluster or between your cluster and your application. Data may move across the internet or within a private network. Encrypting data in transit reduces the risk that an unauthorized user can eavesdrop on network traffic.

This rule is covered by the [emr-security-configuration-encryption-transit](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/emr/emr-security-configuration-encryption-transit.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - emr-security-configuration-encryption-transit.sentinel

    Description:
    This policy requires aws_emr_security_configuration to enable encryption in
    transit.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy emr-security-configuration-encryption-transit.

    ✓ Found 0 resource violations

    emr-security-configuration-encryption-transit.sentinel:64:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - emr-security-configuration-encryption-transit.sentinel

    Description:
    This policy requires aws_emr_security_configuration to enable encryption in
    transit.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy emr-security-configuration-encryption-transit.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_emr_security_configuration.fail_config
        | ✗ failed
        | Amazon EMR security configurations must enable encryption in transit. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/emr-controls.html#emr-4 for more details.


    emr-security-configuration-encryption-transit.sentinel:64:1 - Rule "main"
    Value:
        false
```

---