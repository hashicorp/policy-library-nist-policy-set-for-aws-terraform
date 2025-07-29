# Auto Scaling groups should use multiple instance types in multiple Availability Zones

| Provider            | Category  |
| ------------------- | --------  |
| Amazon Web Services |  Security |

## Description

This control checks whether an Amazon EC2 Auto Scaling group uses multiple instance types. The control fails if the Auto Scaling group has only one instance type defined.

You can enhance availability by deploying your application across multiple instance types running in multiple Availability Zones. Security Hub recommends using multiple instance types so that the Auto Scaling group can launch another instance type if there is insufficient instance capacity in your chosen Availability Zones.

This rule is covered by the [autoscaling-group-should-use-multiple-instance-types](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/autoscaling-group/autoscaling-group-should-use-multiple-instance-types.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - autoscaling-group-should-use-multiple-instance-types.sentinel

    Description:
    This policy checks if resources of type 'aws_autoscaling_group' have the
    multiple instance types

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy autoscaling-group-should-use-multiple-instance-types.

    ✓ Found 0 resource violations

    autoscaling-group-should-use-multiple-instance-types.sentinel:92:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - autoscaling-group-should-use-multiple-instance-types.sentinel

    Description:
    This policy checks if resources of type 'aws_autoscaling_group' have the
    multiple instance types

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy autoscaling-group-should-use-multiple-instance-types.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_autoscaling_group.example
        | ✗ failed
        | AWS Autoscaling Group must use multiple instance types. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-6 for more details.


    autoscaling-group-should-use-multiple-instance-types.sentinel:92:1 - Rule "main"
    Value:
        false
```

---
