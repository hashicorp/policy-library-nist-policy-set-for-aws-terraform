# Attached Amazon EBS volumes should be encrypted at-rest

| Provider            |           Category           |
|---------------------| ---------------------------- |
| Amazon Web Services | Secure Network Configuration |

## Description

DISCLAIMER - This policy works when all resources of type aws_ebs_volume and aws_volume_attachment are present in the root module.

This control checks whether the EBS volumes that are in an attached state are encrypted. To pass this check, EBS volumes must be in use and encrypted. If the EBS volume is not attached, then it is not subject to this check.

For an added layer of security of your sensitive data in EBS volumes, you should enable EBS encryption at rest. Amazon EBS encryption offers a straightforward encryption solution for your EBS resources that doesn't require you to build, maintain, and secure your own key management infrastructure. It uses KMS keys when creating encrypted volumes and snapshots.

This rule is covered by the [ec2-attached-ebs-volumes-encrypted-at-rest](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-attached-ebs-volumes-encrypted-at-rest.sentinel) policy.

## Policy Results (Pass)
```bash
trace:

    Pass - ec2-attached-ebs-volumes-encrypted-at-rest.sentinel

    Description:
    This policy requires `aws_ebs_volume` resources to be encrypted and in
    attached state.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy ec2-attached-ebs-volumes-encrypted-at-rest.

    ✓ Found 0 resource violations

    ec2-attached-ebs-volumes-encrypted-at-rest.sentinel:93:1 - Rule "main"
    Value:
        true

```

---

## Policy Results (Fail)
```bash
trace:

    Fail - ec2-attached-ebs-volumes-encrypted-at-rest.sentinel

    Description:
    This policy requires `aws_ebs_volume` resources to be encrypted and in
    attached state.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-attached-ebs-volumes-encrypted-at-rest.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_ebs_volume.example
        | ✗ failed
        | Attribute 'encrypted' must be 'true' for 'aws_ebs_volume' resources and should be attached. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-3 for more details.


    ec2-attached-ebs-volumes-encrypted-at-rest.sentinel:93:1 - Rule "main"
    Value:
        false
        
```
---