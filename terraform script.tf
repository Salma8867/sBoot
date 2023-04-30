provider "azurerm" {
  features {}
  client_id = "a632ca43-4a30-44ab-9801-d338fed70e93"
  client_secret = "c4l8Q~lxs1Ki5vl.3raLdCNkCEBp2hJRHp7lucER"
  tenant_id = "93017da4-f78e-4730-b2d3-7e7f6117cd4a"
  subscription_id = "c9773807-222b-42d3-86e4-5e5092d270d2"
}

resource "azurerm_resource_group" "salrsg" {
  name     = "SAL-k8s"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "sal_k8s" {
  name                         = "sal-k8s"
  location                     = "East US"
  resource_group_name          = azurerm_resource_group.salrsg.name
  dns_prefix                   = "saldnsprefix"
  kubernetes_version           = "1.25.6"
  
  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_B2s"
    zones      =  ["1"]
  }
  identity {
    type = "SystemAssigned"
  }
 }

  identity {
    type = "SystemAssigned"
  }
