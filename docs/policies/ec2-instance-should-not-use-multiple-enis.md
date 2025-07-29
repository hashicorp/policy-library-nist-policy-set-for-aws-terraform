# Amazon EC2 instances should not use multiple ENIs

| Provider            |      Category      |
| ------------------- | ------------------ |
| Amazon Web Services |  Network Security  |

## Description

This control checks whether an EC2 instance uses multiple Elastic Network Interfaces (ENIs) or Elastic Fabric Adapters (EFAs). This control passes if a single network adapter is used. The control includes an optional parameter list to identify the allowed ENIs. This control also fails if an EC2 instance that belongs to an Amazon EKS cluster uses more than one ENI. If your EC2 instances need to have multiple ENIs as part of an Amazon EKS cluster, you can suppress those control findings.

Multiple ENIs can cause dual-homed instances, meaning instances that have multiple subnets. This can add network security complexity and introduce unintended network paths and access.

This rule is covered by the [ec2-instance-should-not-use-multiple-enis](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ec2/ec2-instance-should-not-use-multiple-enis.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ec2-instance-should-not-use-multiple-enis.sentinel

        Description:
        This policy checks if the EC2 Instance should have the only one Network
        Interface

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ec2-instance-should-not-use-multiple-enis.

        ✓ Found 0 resource violations

        ec2-instance-should-not-use-multiple-enis.sentinel:53:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ec2-instance-should-not-use-multiple-enis.sentinel

        Description:
        This policy checks if the EC2 Instance should have the only one Network
        Interface

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ec2-instance-should-not-use-multiple-enis.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_instance.web
            | ✗ failed
            | Resource EC2 Instance should have the only one Network Interface. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/ec2-controls.html#ec2-17 for more details.


        ec2-instance-should-not-use-multiple-enis.sentinel:53:1 - Rule "main"
        Value:
            false
```

---
