# Elastic File System should be configured to encrypt file data at-rest using AWS KMS

| Provider            |   Category   |
| ------------------- |  ----------  |
| Amazon Web Services |  Data Protection  |

## Description

This control checks whether Amazon Elastic File System is configured to encrypt the file data using AWS KMS. The check fails in the following cases.

Encrypted is set to false in the DescribeFileSystems response.

This rule is covered by the [efs-file-systems-should-be-encrypted-at-rest](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/efs/efs-file-systems-should-be-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - efs-file-systems-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires resources of type `aws_efs_file_system` should have
        'encrypted' set to true and 'kms_key_id' should not be empty.

        Print messages:

        efs_encrypted_values:  {"constant_value": true}
        efs_kms_key_id_values:  {"constant_value": "arn:aws:kms:us-east-1:123456789012:key/example-key-id"}
        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy efs-file-systems-should-be-encrypted-at-rest.

        ✓ Found 0 resource violations

        efs-file-systems-should-be-encrypted-at-rest.sentinel:68:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - efs-file-systems-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires resources of type `aws_efs_file_system` should have
        'encrypted' set to true and 'kms_key_id' should not be empty.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-file-systems-should-be-encrypted-at-rest.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_efs_file_system.example
            | ✗ failed
            | AWS EFS file systems should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-1 for more details.


        efs-file-systems-should-be-encrypted-at-rest.sentinel:68:1 - Rule "main"
        Value:
            false
```

---
