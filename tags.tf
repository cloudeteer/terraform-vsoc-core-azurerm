locals {
  default_tags = {
    "deployment-type" = "cdt-tf"
    "opsinfra"        = "cdt"
    "environment"     = "prod"
    "department"      = "vsoc"
  }

  # Merge custom and default tags
  tags = merge(local.default_tags, var.tags)
}
