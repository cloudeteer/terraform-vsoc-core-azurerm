module "example" {
  # Change "module" and "provider" accordingly to match you new module
  source = "cloudeteer/module/provider"

  tenant_id                    = "00000000-0000-0000-0000-000000000000"
  sentinel_serviceprincipal_id = "11111111-1111-1111-1111-111111111111"
}
