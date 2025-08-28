# Pre-written Sentinel Policies for AWS NIST Foundations Benchmarking

Pre-written Sentinel policies are ready to use compliance checks for NIST AWS Foundations Benchmarking to help enable your AWS resources meet industry security standards.

At HashiCorp, we’re committed to making policy management easier for our customers. We understand that developing policies from scratch can be time-consuming and resource-intensive. To address this, we’re introducing our Prewritten Policy Libraries—expertly crafted, ready-to-use policies designed to streamline your compliance processes and enhance security across your infrastructure.

This repository contains several policies designed to accelerate the adoption of the NIST AWS Foundations Benchmark within HCP Terraform. These policies can be utilized to enforce best practices and security standards across your AWS environment.

For more details on how to work with these policies and to understand the Sentinel language and framework, please refer to the [Sentinel documentation](https://developer.hashicorp.com/sentinel/) or the README documentation included with each of the policy [libraries](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/docs/policies).

## Feedback

We aim to validate the effectiveness of our policies by collecting diverse user feedback and understanding real-world use cases. This input will help refine our policies and enhance their overall impact.

1. You can submit your feedback via a [public survey](https://docs.google.com/forms/d/e/1FAIpQLScswwLMaVaRuYRGJzDjNiycwM4BUa_gAIsAE_zOPdgyFeLXCA/viewform).

2. If you have any issues or enhancement suggestions to the library, please create [a new GitHub issue](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/issues/new).

3. Alternatively, we welcome any contributions that improve the impact of this library! To learn more about contributing and suggesting changes to this library, refer to the [contributing guide](https://github.com/hashicorp/policy-library-NIST-Policy-Set-for-AWS-Terraform/blob/main/CONTRIBUTING.md).

## Getting Started

This getting started guide assumes that:

1. You are familiar with core workflows in HCP Terraform and Terraform Enterprise, and you have an existing workspace configured with AWS access credentials.

   > **Tip:** If you do not have these prerequisites, please refer to the [Use VCS-Driven Workflow](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change) and [Create a Variable Set](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-create-variable-set) tutorials for guidance.

2. You have a user account that is part of the ["owners"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#organization-owners) team or have ["Manage Policies"](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/permissions#manage-policies) organization-level permissions to create new policy sets and policies.

3. Ensure you are using HCP Terraform or Terraform Enterprise [v202312-1](https://developer.hashicorp.com/terraform/enterprise/releases/2023/v202312-1) or a later version.

4. You are using Sentinel version 0.26.x and later version.

By default, the module will enable all policies within the library, and they will be enforced by the HCP Platform with the `enforcement_level` set to `advisory` only.

**Example:**

```
policy "iam-password-expiry" {
  source = "./policies/iam/iam-password-expiry.sentinel"
  enforcement_level = "advisory"
  params = {
    password_expiry_days = 90
  }
}
```

If you want to enable only a subset of the policies or change the [enforcement levels](https://developer.hashicorp.com/sentinel/docs/concepts/enforcement-levels) to either `soft-mandatory` or `hard-mandatory`, we recommend updating the contents of the `sentinel.hcl` file in each library before applying the Terraform configuration.

> **Important:**
> The policies in each library are opinionated and depend on several Sentinel modules. To learn more about modules, please refer to the [Sentinel module](https://developer.hashicorp.com/sentinel/docs/extending/modules) documentation.
>
> To learn more about how to configure a policy set as a [policy evaluation](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets#policy-evaluations), please review the Terraform Enterprise provider [documentation](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/policy_set#agent_enabled).

## Consuming Pre-Written Sentinel Policies for NIST AWS Foundations Benchmark

Following methods outlines various ways to consume and implement pre-written Sentinel policies for the NIST AWS Foundations Benchmark. These policies can be used in both Terraform Enterprise (TFE) and HCP Terraform environments. Below are the recommended methods for integrating these policies into your workflows.

### Terraform Registry Method:

- Navigate to the [Terraform Registry](https://registry.terraform.io/browse/policies) and select the desired Sentinel policy.
- Copy the provided policy snippet from the registry.
- Create a GitHub repository (or use an existing one) to store your policies.
- Add a Sentinel.hcl file to the repository and paste the copied policy snippet(s) into this file.
- Connect the repository to Terraform Cloud or Terraform Enterprise using the VCS (Version Control System) workflow.
- Trigger policy execution automatically during the plan stage in Terraform Cloud or Terraform Enterprise.

### Using the Public GitHub Repository:

- Access the public GitHub repository containing the policy library.
- You can directly use the repository as-is or fork it to customize the policies for your specific requirements.
- If forking, ensure you sync your fork with the upstream repository periodically to stay updated with the latest changes.
- Avoid using the default branch for consumption in Terraform Cloud or Terraform Enterprise. Instead, use the release branches for better stability.
- Attach the repository (or your fork) to Terraform Cloud or Terraform Enterprise using the VCS workflow.
- Run a Terraform plan to execute the policies during the post-plan stage.

### Terraform Module Approach:

- Use a dedicated Terraform module designed to manage Sentinel policy sets.
- Provide a minimal set of variable inputs (typically four) to configure and attach the policies.
- The module will automatically attach the latest versions of multiple policy sets to their respective workspaces.
- Execute a Terraform plan to verify that the policy sets are applied successfully in Terraform Cloud or Terraform Enterprise.

#### Notes and Best Practices

- These policies are compatible with both Terraform Cloud (TFC) and Terraform Enterprise (TFE). Ensure your workflow is configured accordingly.
- When using the public GitHub repository, it is recommended to use release branches for stability and avoid consuming policies directly from the default branch.
- Regularly update your policies to align with the latest NIST AWS Foundations Benchmark standards and Terraform best practices.
- Customize policies as needed to meet your organization's specific compliance and security requirements.

## Resources

- [Get Started - HCP Terraform](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started)
- [Connecting VCS Providers to HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs/vcs)
- [Policy Enforcement](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement)
- [Managing Policy Sets](https://developer.hashicorp.com/terraform/cloud-docs/policy-enforcement/manage-policy-sets)
- [Introduction to Sentinel](https://developer.hashicorp.com/sentinel/intro/what)
- [Sentinel Documentation](https://developer.hashicorp.com/sentinel/docs)
- [Sentinel Language](https://developer.hashicorp.com/sentinel/docs/language/)
- [Sentinel Language Specification](https://developer.hashicorp.com/sentinel/docs/language/spec)
- [Policy Libraries](https://registry.terraform.io/browse/policies)

## Policies Included

- Application Load Balancers should be associated with an AWS WAF web ACL ([docs](https://github.com/hashicorp/policy-library-nist-policy-set-for-aws-terraform/blob/main/docs/policies/application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.md) | [code](https://github.com/hashicorp/policy-library-nist-policy-set-for-aws-terraform/blob/main/policies/elb/application-load-balancers-should-be-associated-with-an-aws-waf-web-acl.sentinel))