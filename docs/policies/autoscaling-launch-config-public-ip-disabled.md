# Amazon EC2 instances launched using Auto Scaling group launch configurations should not have Public IP addresses

| Provider            |             Category             |
| ------------------- |  ------------------------------  |
| Amazon Web Services |   Secure Network Configuration   |

## Description

This control checks whether an Auto Scaling group's associated launch configuration assigns a public IP address to the group's instances. The control fails if the associated launch configuration assigns a public IP address.

Amazon EC2 instances in an Auto Scaling group launch configuration should not have an associated public IP address, except for in limited edge cases. Amazon EC2 instances should only be accessible from behind a load balancer instead of being directly exposed to the internet.

This rule is covered by the [autoscaling-launch-config-public-ip-disabled](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/autoscalinggroup/autoscaling-launch-config-public-ip-disabled.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - autoscaling-launch-config-public-ip-disabled.sentinel

        Description:
        This policy requires resources of type `aws_launch_configuration` should have
        'associate_public_ip_address' set to false.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy autoscaling-launch-config-public-ip-disabled.

        ✓ Found 0 resource violations

        autoscaling-launch-config-public-ip-disabled.sentinel:46:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - autoscaling-launch-config-public-ip-disabled.sentinel

        Description:
        This policy requires resources of type `aws_launch_configuration` should have
        'associate_public_ip_address' set to false.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy autoscaling-launch-config-public-ip-disabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_launch_configuration.as_conf
            | ✗ failed
            | Resource Autoscaling Launch Configuration should have 'associate_public_ip_address' set to false. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-5 for more details.


        autoscaling-launch-config-public-ip-disabled.sentinel:46:1 - Rule "main"
        Value:
            false
```

---
