# Auto Scaling groups associated with a load balancer should use ELB health checks

| Provider            |       Category      |
| ------------------- |  -----------------  |
| Amazon Web Services |   Data Protection   |

## Description

DISCLAIMER - This policy works when all resources of type aws_autoscaling_group and aws_autoscaling_attachment are present in the root module.

This control checks whether an Amazon EC2 Auto Scaling group that is associated with a load balancer uses Elastic Load Balancing (ELB) health checks. The control fails if the Auto Scaling group doesn't use ELB health checks.

ELB health checks help ensure that an Auto Scaling group can determine an instance's health based on additional tests provided by the load balancer. Using Elastic Load Balancing health checks also helps support the availability of applications that use EC2 Auto Scaling groups.

This rule is covered by the [autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/autoscaling-group/autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel

        Description:
        This policy requires `aws_autoscaling_group` resources to be associated with
        load balancers and to have attribute 'health_check_health_check_type' should
        be 'ELB'.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.

        ✓ Found 0 resource violations

        autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel:94:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel

        Description:
        This policy requires `aws_autoscaling_group` resources to be associated with
        load balancers and to have attribute 'health_check_health_check_type' should
        be 'ELB'.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_autoscaling_group.example
            | ✗ failed
            | Attribute 'health_check_type' must be 'ELB' for 'aws_autoscaling_group' and should be associated with the load balancer resource. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/autoscaling-controls.html#autoscaling-1 for more details.


        autoscaling-group-with-load-balancer-attached-should-have-elb-healthcheck.sentinel:94:1 - Rule "main"
        Value:
            false
```

---
