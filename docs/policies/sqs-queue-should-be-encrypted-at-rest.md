# Amazon SQS queues should be encrypted at rest

| Provider            |           Category          |
| ------------------- |  -------------------------  |
| Amazon Web Services |  Secure network management  |

## Description

DISCLAIMER - This policy works when all resources of type aws_sqs_queue are present in the root module.

This control checks whether an Amazon SQS queue is encrypted at rest. The control fails if the queue isn't encrypted with an SQS-managed key (SSE-SQS) or an AWS Key Management Service (AWS KMS) key (SSE-KMS).

Encrypting data at rest reduces the risk of an unauthorized user accessing data stored on disk. Server-side encryption (SSE) protects the contents of messages in SQS queues using SQS-managed encryption keys (SSE-SQS) or AWS KMS keys (SSE-KMS).

This rule is covered by the [sqs-queue-should-be-encrypted-at-rest](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/sqs-queue-should-be-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - sqs-queue-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires resources of type `aws_sqs_queue` to be encrypted at
        rest.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy sqs-queue-should-be-encrypted-at-rest.

        ✓ Found 0 resource violations

        sqs-queue-should-be-encrypted-at-rest.sentinel:67:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - sqs-queue-should-be-encrypted-at-rest.sentinel

        Description:
        This policy requires resources of type `aws_sqs_queue` to be encrypted at
        rest.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sqs-queue-should-be-encrypted-at-rest.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_sqs_queue.terraform_queue
            | ✗ failed
            | SQS queues should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/sqs-controls.html#sqs-1 for more details.


        sqs-queue-should-be-encrypted-at-rest.sentinel:67:1 - Rule "main"
        Value:
            false
```

---
