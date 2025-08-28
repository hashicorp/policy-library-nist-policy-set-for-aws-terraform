# ECS task definitions should not use host network mode

| Provider            |   Category                     |
| ------------------- |  ----------------------------  |
| Amazon Web Services |  Secure network configuration  |

## Description

This control checks whether the latest active revision of an Amazon ECS task definition uses host network mode. The control fails if the latest active revision of the ECS task definition uses host network mode.

When using host network mode, the networking of an Amazon ECS container is tied directly to the underlying host that's running the container. Consequently, this mode allows containers to connect to private loopback network services on the host and to impersonate the host. Other significant drawbacks are that there's no way to remap a container port when using host network mode, and you can't run more than a single instantiation of a task on each host.

This rule is covered by the [ecs-task-definitions-should-not-use-host-network-mode](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/ecs/ecs-task-definitions-should-not-use-host-network-mode.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - ecs-task-definitions-should-not-use-host-network-mode.sentinel

        Description:
        This control checks whether the latest active revision of an Amazon ECS task
        definition uses host network mode.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy ecs-task-definitions-should-not-use-host-network-mode.

        ✓ Found 0 resource violations

        ecs-task-definitions-should-not-use-host-network-mode.sentinel:48:1 - Rule "main"
        Value:
            true

```

---

## Policy Results (Fail)

```bash
trace:
        Fail - ecs-task-definitions-should-not-use-host-network-mode.sentinel

        Description:
        This control checks whether the latest active revision of an Amazon ECS task
        definition uses host network mode.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecs-task-definitions-should-not-use-host-network-mode.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_ecs_task_definition.compliant_task
            | ✗ failed
            | ECS task definitions should not use 'host' network mode for security reasons. Refer to AWS security best practices for more details.


        ecs-task-definitions-should-not-use-host-network-mode.sentinel:47:1 - Rule "main"
        Value:
            false
```

---
