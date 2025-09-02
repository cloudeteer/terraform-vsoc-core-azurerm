<!-- markdownlint-disable first-line-h1 no-inline-html -->

> [!NOTE]
> This repository is publicly accessible as part of our open-source initiative. We welcome contributions from the community alongside our organization's primary development efforts.

---

# terraform-module-template

[![SemVer](https://img.shields.io/badge/SemVer-2.0.0-blue.svg)](https://github.com/cloudeteer/terraform-module-template/releases)

Terraform Module Template

<!-- BEGIN_TF_DOCS -->
## Usage

This example demonstrates the usage of this Terraform module with default settings.

```hcl
module "example" {
  # Change "module" and "provider" accordingly to match you new module
  source = "cloudeteer/module/provider"

  tenant_id                    = "your-tenant-id"
  sentinel_serviceprincipal_id = "your-sentinel-service-principal-id"
}
```

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

- <a name="provider_random"></a> [random](#provider\_random) (~> 3.5)



## Resources

The following resources are used by this module:

- [azurerm_key_vault.secrets](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) (resource)
- [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) (resource)
- [azurerm_monitor_diagnostic_setting.sentinel_auditing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) (resource)
- [azurerm_resource_group.vsoc_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (resource)
- [azurerm_role_assignment.sentinel_playbook_permissions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_sentinel_log_analytics_workspace_onboarding.sentinel](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_log_analytics_workspace_onboarding) (resource)
- [random_string.key_vault_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_sentinel_serviceprincipal_id"></a> [sentinel\_serviceprincipal\_id](#input\_sentinel\_serviceprincipal\_id)

Description: The Sentinel Service principal ID.

Type: `string`

### <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)

Description: The Azure Active Directory tenant ID.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location)

Description: The Azure region for the resources to be deployed.

Type: `string`

Default: `"germanywestcentral"`

### <a name="input_key_vault_bypass"></a> [key\_vault\_bypass](#input\_key\_vault\_bypass)

Description: Bypass value for the Key Vault.

Type: `string`

Default: `"AzureServices"`

### <a name="input_key_vault_default_action"></a> [key\_vault\_default\_action](#input\_key\_vault\_default\_action)

Description: Default action for the Key Vault.

Type: `string`

Default: `"Deny"`

### <a name="input_key_vault_ip_rules"></a> [key\_vault\_ip\_rules](#input\_key\_vault\_ip\_rules)

Description: IP Rules for the Key Vault

Type: `list(string)`

Default: `[]`

### <a name="input_key_vault_name_prefix"></a> [key\_vault\_name\_prefix](#input\_key\_vault\_name\_prefix)

Description: The name of the Key Vault.

Type: `string`

Default: `"kvvsocdevgwc"`

### <a name="input_key_vault_sku"></a> [key\_vault\_sku](#input\_key\_vault\_sku)

Description: The SKU (plan) for the Key Vault.

Type: `string`

Default: `"standard"`

### <a name="input_key_vault_vnet_ids"></a> [key\_vault\_vnet\_ids](#input\_key\_vault\_vnet\_ids)

Description: VNet IDs for the Key Vault.

Type: `list(string)`

Default: `[]`

### <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name)

Description: The name of the Log Analytics Workspace.

Type: `string`

Default: `"log-vsoc-dev-gwc-01"`

### <a name="input_log_analytics_workspace_retention_time"></a> [log\_analytics\_workspace\_retention\_time](#input\_log\_analytics\_workspace\_retention\_time)

Description: Number of days to retain log data. Valid range: 30 to 730 (2 years).

Type: `number`

Default: `90`

### <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku)

Description: Pricing tier for the Log Analytics Workspace.

Type: `string`

Default: `"PerGB2018"`

### <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled)

Description: Flag if purge protection is enabled.

Type: `bool`

Default: `true`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group.

Type: `string`

Default: `"rg-vsoc-dev-gwc-01"`

### <a name="input_sentinel_customer_managed_key_enabled"></a> [sentinel\_customer\_managed\_key\_enabled](#input\_sentinel\_customer\_managed\_key\_enabled)

Description: Enable customer managed key for Sentinel

Type: `bool`

Default: `false`

### <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days)

Description: Retention Time for Logs in the Log Analytics Workspace.

Type: `number`

Default: `7`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Custom tags to merge with module defaults.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id)

Description: The ID of the Log Analytics Workspace

### <a name="output_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#output\_log\_analytics\_workspace\_name)

Description: The Name of the Log Analytics Workspace
<!-- END_TF_DOCS -->

## Contributions

We welcome all kinds of contributions, whether it's reporting bugs, submitting feature requests, or directly contributing to the development. Please read our [Contributing Guidelines](CONTRIBUTING.md) to learn how you can best contribute.

Thank you for your interest and support!

## Copyright and license

<img width=200 alt="Logo" src="https://raw.githubusercontent.com/cloudeteer/cdt-public/main/img/cdt_logo_orig_4c.svg">

© 2024 CLOUDETEER GmbH

This project is licensed under the [MIT License](LICENSE).
