mock_provider "azurerm" { source = "./tests/local/mocks" }

variables {
  tenant_id                    = "00000000-0000-0000-0000-000000000000"
  sentinel_serviceprincipal_id = "11111111-1111-1111-1111-111111111111"
}

run "should_abbort_creating_invalid_resource_group" {
  command = plan

  expect_failures = [
    var.resource_group_name
  ]

  variables {
    resource_group_name = "badname"
  }

}

run "should_abbort_creating_invalid_key_vault" {
  command = plan

  expect_failures = [
    var.key_vault_name_prefix
  ]

  variables {
    key_vault_name_prefix = "badname"
  }

}

run "should_abbort_creating_invalid_law" {
  command = plan

  expect_failures = [
    var.log_analytics_workspace_name,
  ]

  variables {
    log_analytics_workspace_name = "badname"
  }

}
