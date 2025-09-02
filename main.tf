# Resource Group
resource "azurerm_resource_group" "vsoc_service" {
  name     = var.resource_group_name
  tags     = local.tags
  location = var.azure_location
}

# Key Vault
resource "random_string" "key_vault_suffix" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_key_vault" "secrets" {
  name                       = "${var.key_vault_name_prefix}-${random_string.key_vault_suffix.result}"
  tags                       = local.tags
  location                   = var.azure_location
  resource_group_name        = azurerm_resource_group.vsoc_service.name
  tenant_id                  = var.tenant_id
  sku_name                   = var.key_vault_sku
  purge_protection_enabled   = var.purge_protection_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

  network_acls {
    default_action             = var.key_vault_default_action
    bypass                     = var.key_vault_bypass
    ip_rules                   = var.key_vault_ip_rules
    virtual_network_subnet_ids = var.key_vault_vnet_ids
  }
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "logs" {
  name                = var.log_analytics_workspace_name
  tags                = local.tags
  location            = var.azure_location
  resource_group_name = azurerm_resource_group.vsoc_service.name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_analytics_workspace_retention_time
}

# Sentinel
resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id                 = azurerm_log_analytics_workspace.logs.id
  customer_managed_key_enabled = var.sentinel_customer_managed_key_enabled
}

# Enable Sentinel "Auditing and Health Monitoring"
resource "azurerm_monitor_diagnostic_setting" "sentinel_auditing" {
  name                       = "SentinelAllLogs"
  target_resource_id         = "${azurerm_log_analytics_workspace.logs.id}/providers/Microsoft.SecurityInsights/settings/SentinelHealth"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id

  enabled_log {
    category_group = "allLogs"
  }

  depends_on = [
    azurerm_sentinel_log_analytics_workspace_onboarding.sentinel
  ]
}

# Set Sentinel Playbook permissions
# TODO: Replace with dynamic lookup below (pipeline permissions needed)
resource "azurerm_role_assignment" "sentinel_playbook_permissions" {
  scope                = azurerm_resource_group.vsoc_service.id
  role_definition_name = "Microsoft Sentinel Automation Contributor"
  principal_id         = var.sentinel_serviceprincipal_id
}

# DYNAMIC LOOKUP (replace later)
# # Set Sentinel Playbook permissions
# ## Get the Sentinel service principal
# data "azuread_service_principal" "sentinel_serviceprincipal" {
#   display_name = "Azure Security Insights"
# }
# ## Give the serivce principal Contributor permissions
# resource "azurerm_role_assignment" "sentinel_playbook_permissions" {
#   scope                = azurerm_resource_group.vsoc-rg.id
#   role_definition_name = "Microsoft Sentinel Playbook Contributor"
#   principal_id         = data.azuread_service_principal.sentinel_serviceprincipal.object_id
# }
