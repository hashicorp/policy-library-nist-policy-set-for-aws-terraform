# EFS access points should enforce a user identity

| Provider            |   Category   |
| ------------------- |  ----------  |
| Amazon Web Services |  Secure access management  |

## Description

This control checks whether Amazon EFS access points are configured to enforce a user identity. This control fails if a POSIX user identity is not defined while creating the EFS access point.

Amazon EFS access points are application-specific entry points into an EFS file system that make it easier to manage application access to shared datasets. Access points can enforce a user identity, including the user's POSIX groups, for all file system requests that are made through the access point. Access points can also enforce a different root directory for the file system so that clients can only access data in the specified directory or its subdirectories.

This rule is covered by the [efs-access-point-should-enforce-user-identity](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/efs/efs-access-point-should-enforce-user-identity.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - efs-access-point-should-enforce-user-identity.sentinel

        Description:
        This policy requires resources of type `aws_efs_access_point` have attribute
        `posix_user` should be defined.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy efs-access-point-should-enforce-user-identity.

        ✓ Found 0 resource violations

        efs-access-point-should-enforce-user-identity.sentinel:45:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - efs-access-point-should-enforce-user-identity.sentinel

        Description:
        This policy requires resources of type `aws_efs_access_point` have attribute
        `posix_user` should be defined.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-access-point-should-enforce-user-identity.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_efs_access_point.test
            | ✗ failed
            | Attribute 'posix_user' should be defined for 'aws_efs_access_point' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-4 for more details.


        efs-access-point-should-enforce-user-identity.sentinel:45:1 - Rule "main"
        Value:
            false
```

---
