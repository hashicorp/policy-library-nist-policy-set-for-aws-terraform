# Application, Network and Gateway Load Balancers should span multiple Availability Zones

| Provider            | Category     |
|---------------------|--------------|
| Amazon Web Services | Resilience   |

## Description

This control checks whether an Elastic Load Balancer V2 (Application, Network, or Gateway Load Balancer) has registered instances from at least the specified number of Availability Zones (AZs). The control fails if an Elastic Load Balancer V2 doesn't have instances registered in at least the specified number of AZs. Unless you provide a custom parameter value for the minimum number of AZs, Security Hub uses a default value of two AZs.

Elastic Load Balancing automatically distributes your incoming traffic across multiple targets, such as EC2 instances, containers, and IP addresses, in one or more Availability Zones. Elastic Load Balancing scales your load balancer as your incoming traffic changes over time. It is recommended to configure at least two availability zones to ensure availability of services, as the Elastic Load Balancer will be able to direct traffic to another availability zone if one becomes unavailable. Having multiple availability zones configured will help eliminate having a single point of failure for the application.

This rule is covered by the [elb-multiple-az](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/elb/elb-multiple-az.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - elb-multiple-az.sentinel

    Description:
    This policy ensures that Application, Network, and Gateway Load Balancers span
    multiple Availability Zones

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy elb-multiple-az.

    ✓ Found 0 resource violations

    elb-multiple-az.sentinel:44:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - elb-multiple-az.sentinel

    Description:
    This policy ensures that Application, Network, and Gateway Load Balancers span
    multiple Availability Zones

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy elb-multiple-az.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_lb.fail_lb
        | ✗ failed
        | Load balancers should span multiple Availability Zones for high availability. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/elb-controls.html#elb-13 for more details.


    elb-multiple-az.sentinel:44:1 - Rule "main"
    Value:
        false
```

---