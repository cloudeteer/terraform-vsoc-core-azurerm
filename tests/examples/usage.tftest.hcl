mock_provider "azurerm" {
  source = "./tests/examples/mocks"
}

run "test_example_usage" {
  command = apply

  module {
    source = "./examples/usage"
  }
}
