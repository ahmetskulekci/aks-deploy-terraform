resource "azurerm_resource_group" "aks-dev" {
  name     = "rg-azno-dev-mordor"
  location = "North Europe"
}

resource "azurerm_kubernetes_cluster" "mordor" {
  name                = "aks-azno-dev-mordor"
  location            = azurerm_resource_group.aks-dev.location
  resource_group_name = azurerm_resource_group.aks-dev.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "vmpool"
    node_count = 1
    vm_size    = "Standard_B2s"
    enable_auto_scaling = "true"
    min_count = var.min_count
    max_count = var.max_count
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.network_plugin
  }

  tags = {
    CreatedDepartent = "Security"
    CreatedBy = "Terraform"
    Environment = "Development"
  }
}
