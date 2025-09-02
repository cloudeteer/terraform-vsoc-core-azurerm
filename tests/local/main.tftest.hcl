run "should_have_required_tenant_id" {
  command = plan

  variables {
    tenant_id = "my-tenant-id"
    sentinel_serviceprincipal_id = "my-service-principal-id"
  }

  # # https://developer.hashicorp.com/terraform/language/tests#expecting-failures
  # expect_failures = [
  #   var.example_variable,
  # ]
}

run "test_output" {
  command = plan

  variables {
    tenant_id = "my-tenant-id"
    sentinel_serviceprincipal_id = "my-service-principal-id"
  }

  assert {
    condition     = var.tenant_id == "my-tenant-id"
    error_message = "Variable tenant_id not equal to expected value"
  }
}
