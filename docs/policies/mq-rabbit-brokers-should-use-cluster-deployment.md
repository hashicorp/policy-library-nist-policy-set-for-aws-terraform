# RabbitMQ brokers should use cluster deployment mode

| Provider            |       Category      |
| ------------------- |  -----------------  |
| Amazon Web Services |  High Availability  |

## Description

This control checks whether the deployment mode for an Amazon MQ RabbitMQ broker is set to cluster deployment. The control fails if a single-instance broker (enabled by default) is set as the deployment mode.

Cluster deployment provides high availability for your Amazon MQ RabbitMQ brokers in an AWS Region. The cluster deployment is a logical grouping of three RabbitMQ broker nodes, each with its own Amazon Elastic Block Store (Amazon EBS) volume and a shared state. The cluster deployment ensures that data is replicated to all nodes in the cluster, which can reduce downtime and loss of data in the event of a failure.

This rule is covered by the [mq-rabbit-brokers-should-use-cluster-deployment](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/mq/mq-rabbit-brokers-should-use-cluster-deployment.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - mq-rabbit-brokers-should-use-cluster-deployment.sentinel

        Description:
        This policy checks if resources of type 'aws_mq_broker' have the
        'deployment_mode' attribute set to 'CLUSTER_MULTI_AZ'
        for RabbitMQ brokers.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy mq-rabbit-brokers-should-use-cluster-deployment.

        ✓ Found 0 resource violations

        mq-rabbit-brokers-should-use-cluster-deployment.sentinel:56:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - mq-rabbit-brokers-should-use-cluster-deployment.sentinel

        Description:
        This policy checks if resources of type 'aws_mq_broker' have the
        'deployment_mode' attribute set to 'CLUSTER_MULTI_AZ'
        for RabbitMQ brokers.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy mq-rabbit-brokers-should-use-cluster-deployment.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_mq_broker.example
            | ✗ failed
            | Attribute 'deployment_mode' should be 'CLUSTER_MULTI_AZ' for AWS RabbitMQ Broker. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/mq-controls.html#mq-6 for more details.


        mq-rabbit-brokers-should-use-cluster-deployment.sentinel:56:1 - Rule "main"
        Value:
            false
```

---
