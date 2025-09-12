output "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.logs.id
}

output "log_analytics_workspace_name" {
  description = "The Name of the Log Analytics Workspace"
  value       = azurerm_log_analytics_workspace.logs.name
}
