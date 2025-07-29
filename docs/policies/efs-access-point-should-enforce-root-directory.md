# EFS access points should enforce a root directory

| Provider            |   Category   |
| ------------------- |  ----------  |
| Amazon Web Services |  Secure access management  |

## Description

This control checks if Amazon EFS access points are configured to enforce a root directory. The control fails if the value of Path is set to / (the default root directory of the file system).

When you enforce a root directory, the NFS client using the access point uses the root directory configured on the access point instead of the file system's root directory. Enforcing a root directory for an access point helps restrict data access by ensuring that users of the access point can only reach files of the specified subdirectory.

This rule is covered by the [efs-access-point-should-enforce-root-directory](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/efs/efs-access-point-should-enforce-root-directory.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - efs-access-point-should-enforce-root-directory.sentinel

        Description:
        This policy requires resources of type `aws_efs_access_point` have attribute
        `root_directory` should not have path set to '/'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy efs-access-point-should-enforce-root-directory.

        ✓ Found 0 resource violations

        efs-access-point-should-enforce-root-directory.sentinel:53:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - efs-access-point-should-enforce-root-directory.sentinel

        Description:
        This policy requires resources of type `aws_efs_access_point` have attribute
        `root_directory` should not have path set to '/'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy efs-access-point-should-enforce-root-directory.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_efs_access_point.test
            | ✗ failed
            | Attribute 'path' should not be '/' in 'root_directory' for 'aws_efs_access_point' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-3 for more details.


        efs-access-point-should-enforce-root-directory.sentinel:53:1 - Rule "main"
        Value:
            false
```

---
