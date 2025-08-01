# Application and Network Load Balancers with listeners should use recommended security policies

| Provider            | Category          |
|---------------------|-------------------|
| Amazon Web Services | Data Protection   |

## Description

This control checks whether the HTTPS listener for an Application Load Balancer or the TLS listener for a Network Load Balancer is configured to encrypt data in transit by using a recommended security policy. The control fails if the HTTPS or TLS listener for a load balancer isn't configured to use a recommended security policy.

Elastic Load Balancing uses an SSL negotiation configuration, known as a security policy, to negotiate connections between a client and a load balancer. The security policy specifies a combination of protocols and ciphers. The protocol establishes a secure connection between a client and a server. A cipher is an encryption algorithm that uses encryption keys to create a coded message. During the connection negotiation process, the client and the load balancer present a list of ciphers and protocols that they each support, in order of preference. Using a recommended security policy for a load balancer can help you meet compliance and security standards.

This rule is covered by the [elb-predefined-security-policy-ssl-check](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/elb/elb-predefined-security-policy-ssl-check.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
    Pass - elb-predefined-security-policy-ssl-check.sentinel

    Description:
    This policy requires 'aws_lb_listener' resources using HTTPS/TLS to use
    recommended SSL policies.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy elb-predefined-security-policy-ssl-check.

    ✓ Found 0 resource violations

    elb-predefined-security-policy-ssl-check.sentinel:71:1 - Rule "main"
    Value:
        true
```

---

## Policy Results (Fail)
```bash
trace:
    Fail - elb-predefined-security-policy-ssl-check.sentinel

    Description:
    This policy requires 'aws_lb_listener' resources using HTTPS/TLS to use
    recommended SSL policies.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy elb-predefined-security-policy-ssl-check.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_lb_listener.pass_listener
        | ✗ failed
        | Load balancer listeners using HTTPS or TLS must use a recommended SSL policy. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/elb-controls.html#elb-17 for more details.


    elb-predefined-security-policy-ssl-check.sentinel:71:1 - Rule "main"
    Value:
        false
```

---