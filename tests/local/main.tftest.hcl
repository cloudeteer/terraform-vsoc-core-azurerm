mock_provider "azurerm" {
  source = "./tests/local/mocks"
}

run "test_local_usage" {
  command = apply

  module {
    source = "./tests/local"
  }
}
