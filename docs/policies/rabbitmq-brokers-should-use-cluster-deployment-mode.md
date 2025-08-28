# Application Load Balancers should be associated with an AWS WAF web ACL

| Provider            |             Category             |
| ------------------- |  ------------------------------  |
| Amazon Web Services |   Protective services  |

## Description

This control checks whether an Application Load Balancer is associated with an AWS WAF Classic or AWS WAF web access control list (web ACL). The control fails if the Enabled field for the AWS WAF configuration is set to false.

AWS WAF is a web application firewall that helps protect web applications and APIs from attacks. With AWS WAF, you can configure a web ACL, which is a set of rules that allow, block, or count web requests based on customizable web security rules and conditions that you define. We recommend associating your Application Load Balancer with an AWS WAF web ACL to help protect it from malicious attacks.

This rule is covered by the [rabbitmq-brokers-should-use-cluster-deployment-mode](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/mq/rabbitmq-brokers-should-use-cluster-deployment-mode.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - rabbitmq-brokers-should-use-cluster-deployment-mode.sentinel

        Description:
        This control checks whether an Application Load Balancer is associated with an
        AWS WAF Classic or AWS WAF web access control list (web ACL).

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy aws-mq-6-rabbitmq-brokers-should-use-cluster-deployment-mode.

        ✓ Found 0 resource violations

        rabbitmq-brokers-should-use-cluster-deployment-mode.sentinel:58:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - rabbitmq-brokers-should-use-cluster-deployment-mode.sentinel

        Description:
        This control checks whether an Application Load Balancer is associated with an
        AWS WAF Classic or AWS WAF web access control list (web ACL).

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy aws-mq-6-rabbitmq-brokers-should-use-cluster-deployment-mode.

        Found 1 resource violations

        → Module name: root
            ↳ Resource Address: aws_mq_broker.rabbitmq_broker
                | ✗ failed
                | RabbitMQ brokers should use CLUSTER_MULTI_AZ deployment mode for high availability. Refer to AWS security best practices for more details.


        rabbitmq-brokers-should-use-cluster-deployment-mode.sentinel:58:1 - Rule "main"
        Value:
            false
```

---
