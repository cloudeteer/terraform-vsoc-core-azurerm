module "example" {
  # Change "module" and "provider" accordingly to match you new module
  source = "cloudeteer/module/provider"

  tenant_id                    = "your-tenant-id"
  sentinel_serviceprincipal_id = "your-sentinel-service-principal-id"
}
