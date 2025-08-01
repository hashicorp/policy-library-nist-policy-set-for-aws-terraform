# OpenSearch domains should not be publicly accessible

| Provider            | Category                     |
|---------------------|------------------------------|
| Amazon Web Services | Secure network configuration |

## Description

DISCLAIMER - This policy works when all resources of type 'aws_opensearch_domain' to be in the root module.

This control checks whether OpenSearch domains are in a VPC. It does not evaluate the VPC subnet routing configuration to determine public access.

OpenSearch domains deployed within a VPC can communicate with VPC resources over the private AWS network, without the need to traverse the public internet. This configuration increases the security posture by limiting access to the data in transit. VPCs provide a number of network controls to secure access to OpenSearch domains, including network ACL and security groups. Security Hub recommends that you migrate public OpenSearch domains to VPCs to take advantage of these controls.

This rule is covered by the [opensearch-in-vpc-only](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/policies/opensearch/opensearch-in-vpc-only.sentinel) policy.

## Policy Results (Pass)
```bash
trace:
      Pass - opensearch-in-vpc-only.sentinel

      Description:
        This policy checks whether OpenSearch domains are in a VPC. It does not
        evaluate the VPC subnet routing configuration to determine public access.

      Print messages:

      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy opensearch-in-vpc-only.

      ✓ Found 0 resource violations

      opensearch-in-vpc-only.sentinel:52:1 - Rule "main"
        Value:
          true
```

---

## Policy Results (Fail)
```bash
trace:
      Fail - opensearch-in-vpc-only.sentinel

      Description:
        This policy checks whether OpenSearch domains are in a VPC. It does not
        evaluate the VPC subnet routing configuration to determine public access.

      Print messages:

      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy opensearch-in-vpc-only.

      Found 1 resource violations

      → Module name: root
        ↳ Resource Address: aws_opensearch_domain.public_domain
          | ✗ failed
          | OpenSearch domains should be in VPC. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/opensearch-controls.html#opensearch-2 for more details.


      opensearch-in-vpc-only.sentinel:52:1 - Rule "main"
        Value:
          false
```

---