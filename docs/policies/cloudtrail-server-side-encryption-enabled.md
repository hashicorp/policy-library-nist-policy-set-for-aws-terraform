# CloudTrail should have encryption at-rest enabled

| Provider            | Category                |
|---------------------|-------------------------|
| Amazon Web Services | Data Protection |

## Description
This control checks whether CloudTrail is configured to use the server-side encryption (SSE) AWS KMS key encryption. The control fails if the KmsKeyId isn't defined.

For an added layer of security for your sensitive CloudTrail log files, you should use [server-side encryption with AWS KMS keys (SSE-KMS)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html) for your CloudTrail log files for encryption at rest. Note that by default, the log files delivered by CloudTrail to your buckets are encrypted by [Amazon server-side encryption with Amazon S3-managed encryption keys (SSE-S3)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html).
This rule is covered by the [cloudtrail-server-side-encryption-enabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - cloudtrail-server-side-encryption-enabled.sentinel

    Description:
      This policy requires that resources of type `aws_cloudtrail` have server-side
      encryption enabled.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy cloudtrail-server-side-encryption-enabled.

    ✓ Found 0 resource violations

    cloudtrail-server-side-encryption-enabled.sentinel:37:1 - Rule "main"
      Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:

    Fail - cloudtrail-server-side-encryption-enabled.sentinel

    Description:
      This policy requires that resources of type `aws_cloudtrail` have server-side
      encryption enabled.
      
    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-server-side-encryption-enabled.

    Found 1 resource violations

    → Module name: root
       ↳ Resource Address: aws_cloudtrail.example
         | ✗ failed
         | Attribute 'kms_key_id' must be present for 'aws_cloudtrail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-2 for more details.


    cloudtrail-server-side-encryption-enabled.sentinel:37:1 - Rule "main"
      Value:
        false

```

---
