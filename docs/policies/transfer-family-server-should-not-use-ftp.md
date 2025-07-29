# Transfer Family servers should not use FTP protocol for endpoint connection

| Provider            |   Category   |
| ------------------- | -----------  |
| Amazon Web Services |  Encryption  |

## Description

This control checks whether an AWS Transfer Family server uses a protocol other than FTP for endpoint connection. The control fails if the server uses FTP protocol for a client to connect to the server's endpoint.

FTP (File Transfer Protocol) establishes the endpoint connection through unencrypted channels, leaving data sent over these channels vulnerable to interception. Using SFTP (SSH File Transfer Protocol), FTPS (File Transfer Protocol Secure), or AS2 (Applicability Statement 2) offers an extra layer of security by encrypting your data in transit and can be used to help prevent potential attackers from using person-in-the-middle or similar attacks to eavesdrop on or manipulate network traffic.

This rule is covered by the [transfer-family-server-should-not-use-ftp](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/transfer/transfer-family-server-should-not-use-ftp.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
    Pass - transfer-family-server-should-not-use-ftp.sentinel

    Description:
    This policy requires AWS Transfer Servers shouldn't contain "FTP" for the
    attribute protocols.

    Print messages:

    → → Overall Result: true

    This result means that all resources have passed the policy check for the policy transfer-family-server-should-not-use-ftp.

    ✓ Found 0 resource violations

    transfer-family-server-should-not-use-ftp.sentinel:47:1 - Rule "main"
    Description:
        Rules

    Value:
        true
```

---

## Policy Results (Fail)

```bash
trace:
    Fail - transfer-family-server-should-not-use-ftp.sentinel

    Description:
    This policy requires AWS Transfer Servers shouldn't contain "FTP" for the
    attribute protocols.

    Print messages:

    → → Overall Result: false

    This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy transfer-family-server-should-not-use-ftp.

    Found 1 resource violations

    → Module name: root
    ↳ Resource Address: aws_transfer_server.example
        | ✗ failed
        | Transfer Family servers should not use FTP protocol for endpoint connection. For more information, Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/transfer-controls.html#transfer-2 for more details.


    transfer-family-server-should-not-use-ftp.sentinel:47:1 - Rule "main"
    Description:
        Rules

    Value:
        false
```

---
