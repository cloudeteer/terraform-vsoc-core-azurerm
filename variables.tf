variable "azure_location" {
  description = "The Azure region for the resources to be deployed."
  type        = string
  default     = "germanywestcentral"
}

variable "key_vault_bypass" {
  description = "Bypass value for the Key Vault."
  type        = string
  default     = "AzureServices"
}

variable "key_vault_default_action" {
  description = "Default action for the Key Vault."
  type        = string
  default     = "Deny"
}

variable "key_vault_ip_rules" {
  description = "IP Rules for the Key Vault"
  type        = list(string)
  default     = []
}

variable "key_vault_name_prefix" {
  description = "The name of the Key Vault."
  type        = string
  default     = "kvvsocdevgwc"

  validation {
    condition     = can(regex("^kvvsoc(dev|test|prod)(gwc|weu)$", var.key_vault_name_prefix))
    error_message = "Key Vault name prefix must follow the pattern: kvvsoc(dev|test|prod)(gwc|weu), e.g., kvvsocdevgwc"
  }
}

variable "key_vault_sku" {
  description = "The SKU (plan) for the Key Vault."
  type        = string
  default     = "standard"
}

variable "key_vault_vnet_ids" {
  description = "VNet IDs for the Key Vault."
  type        = list(string)
  default     = []
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
  default     = "log-vsoc-dev-gwc-01"

  validation {
    condition     = can(regex("^log-vsoc-(dev|test|prod)-(gwc|weu)-[0-9]{2,}$", var.log_analytics_workspace_name))
    error_message = "Log Analytics Workspace name must follow the pattern: log-vsoc-(dev|test|prod)-(gwc|weu)-<number>, e.g., log-vsoc-dev-gwc-01"
  }
}

variable "log_analytics_workspace_retention_time" {
  description = "Number of days to retain log data. Valid range: 30 to 730 (2 years)."
  type        = number
  default     = 90

  validation {
    condition     = var.log_analytics_workspace_retention_time >= 30 && var.log_analytics_workspace_retention_time <= 730
    error_message = "Retention for the Log Analytics Workspace must be between 30 and 730 days."
  }
}

variable "log_analytics_workspace_sku" {
  description = "Pricing tier for the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018" # pay-as-you-go

  validation {
    condition     = contains(["PerGB2018", "Free", "Standalone", "CapacityReservation", "Legacy"], var.log_analytics_workspace_sku)
    error_message = "Invalid SKU for the Log Analytics Workspace choosed. Allowed values: PerGB2018, Free, Standalone, CapacityReservation, Legacy."
  }
}

variable "purge_protection_enabled" {
  description = "Flag if purge protection is enabled."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "rg-vsoc-dev-gwc-01"

  validation {
    condition     = can(regex("^rg-vsoc-(dev|test|prod)-(gwc|weu)-[0-9]{2,}$", var.resource_group_name))
    error_message = "Resource group name must follow the pattern: rg-vsoc-(dev|test|prod)-(gwc|weu)-<number>, e.g., rg-vsoc-dev-gwc-01"
  }
}

variable "sentinel_customer_managed_key_enabled" {
  description = "Enable customer managed key for Sentinel"
  type        = bool
  default     = false
}

variable "sentinel_serviceprincipal_id" {
  description = "The Sentinel Service principal ID."
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Retention Time for Logs in the Log Analytics Workspace."
  type        = number
  default     = 7
}

variable "tags" {
  description = "Custom tags to merge with module defaults."
  type        = map(string)
  default     = {}
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID."
  type        = string
}
