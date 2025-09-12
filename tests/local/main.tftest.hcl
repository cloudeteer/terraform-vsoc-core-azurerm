mock_provider "azurerm" { source = "./tests/local/mocks" }

variables {
  tenant_id                    = "00000000-0000-0000-0000-000000000000"
  sentinel_serviceprincipal_id = "11111111-1111-1111-1111-111111111111"
}

run "should_pass_with_valid_resource_names" {
  command = plan

  variables {
    resource_group_name          = "rg-vsoc-prod-gwc-02"
    key_vault_name_prefix        = "kvvsocprodgwc"
    log_analytics_workspace_name = "log-vsoc-prod-gwc-02"
  }

}

run "should_fail_with_invalid_resource_names" {
  command = plan

  variables {
    resource_group_name          = "rg-vsoc-shouldfail-gwc-02"
    key_vault_name_prefix        = "kvshouldfailprodgwc"
    log_analytics_workspace_name = "log-vsoc-prod-gwc"
  }

  expect_failures = [
    var.resource_group_name,
    var.key_vault_name_prefix,
    var.log_analytics_workspace_name
  ]

}
