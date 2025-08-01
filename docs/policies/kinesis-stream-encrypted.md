# Kinesis streams should be encrypted at rest

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Description

This control checks if Kinesis Data Streams are encrypted at rest with server-side encryption. This control fails if a Kinesis stream is not encrypted at rest with server-side encryption.

Server-side encryption is a feature in Amazon Kinesis Data Streams that automatically encrypts data before it's at rest by using an AWS KMS key. Data is encrypted before it's written to the Kinesis stream storage layer, and decrypted after it's retrieved from storage. As a result, your data is encrypted at rest within the Amazon Kinesis Data Streams service.

This rule is covered by the [kinesis-stream-encrypted](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/kinesis/kinesis-stream-encrypted.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - kinesis-stream-encrypted.sentinel

      Description:
        This policy checks if resources of type 'kinesis-stream-encrypted' have the
        'encryption_type'
        set to 'KMS'

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy kinesis-stream-encrypted.

      ✓ Found 0 resource violations

      kinesis-stream-encrypted.sentinel:54:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - kinesis-stream-encrypted.sentinel

      Description:
        This policy checks if resources of type 'kinesis-stream-encrypted' have the
        'encryption_type'
        set to 'KMS'

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy kinesis-stream-encrypted.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_kinesis_stream.test_stream
          | ✗ failed
          | Attribute 'kms_key_id' attribute must be specified and not empty, and 'encryption_type' must be set to 'KMS' for the AWS Kinesis Stream. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/kinesis-controls.html#kinesis-1 for more details.


      kinesis-stream-encrypted.sentinel:54:1 - Rule "main"
        Value:
          false
```

---