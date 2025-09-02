terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    # TODO: Use this provider for dynamic lookup
    # azuread = {
    #   source  = "hashicorp/azuread"
    #   version = "~> 3.0"
    # }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

}
