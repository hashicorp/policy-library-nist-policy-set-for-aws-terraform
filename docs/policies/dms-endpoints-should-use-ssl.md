# DMS endpoints should use SSL

| Provider            |       Category      |
| ------------------- |  -----------------  |
| Amazon Web Services |   Data Protection   |

## Description

This control checks whether an AWS DMS endpoint uses an SSL connection. The control fails if the endpoint doesn't use SSL.

SSL/TLS connections provide a layer of security by encrypting connections between DMS replication instances and your database. Using certificates provides an extra layer of security by validating that the connection is being made to the expected database. It does so by checking the server certificate that is automatically installed on all database instances that you provision. By enabling SSL connection on your DMS endpoints, you protect the confidentiality of the data during the migration.

This rule is covered by the [dms-endpoints-should-use-ssl](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/dms-endpoints-should-use-ssl.sentinel) policy.

## Policy Results (Pass)

```bash
trace:
        Pass - dms-endpoints-should-use-ssl.sentinel

        Description:
        This policy requires resources of type `aws_dms_endpoint` have attribute
        "ssl_mode" set to one of: require, verify-ca, verify-full.

        Print messages:

        → → Overall Result: true

        This result means that all resources have passed the policy check for the policy dms-ssl-enabled.

        ✓ Found 0 resource violations

        dms-endpoints-should-use-ssl.sentinel:45:1 - Rule "main"
        Value:
            true
```

---

## Policy Results (Fail)

```bash
trace:
        Fail - dms-endpoints-should-use-ssl.sentinel

        Description:
        This policy requires resources of type `aws_dms_endpoint` have attribute
        "ssl_mode" set to one of: require, verify-ca, verify-full.

        Print messages:

        → → Overall Result: false

        This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy dms-ssl-enabled.

        Found 1 resource violations

        → Module name: root
        ↳ Resource Address: aws_dms_endpoint.example
            | ✗ failed
            | Attribute 'ssl_mode' must be set to one of: require, verify-ca, verify-full for 'aws_dms_endpoint' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-9 for more details.


        dms-endpoints-should-use-ssl.sentinel:45:1 - Rule "main"
        Value:
            false
```

---
