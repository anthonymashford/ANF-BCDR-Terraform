resource "azurerm_virtual_network" "vnet_anf" {
  name                = "vnet-anf"
  location            = azurerm_resource_group.anf_bcdr_rg.location
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  address_space       = ["172.16.0.0/16"]
  tags = {
    Environment = "lab"
  }
}

resource "azurerm_subnet" "subnet_servers" {
  name                 = "subnet-servers"
  resource_group_name  = azurerm_resource_group.anf_bcdr_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_anf.name
  address_prefixes     = ["172.16.1.0/24"]
}

resource "azurerm_subnet" "subnet_anf" {
  name                 = "subnet-anf"
  resource_group_name  = azurerm_resource_group.anf_bcdr_rg.name
  virtual_network_name = azurerm_virtual_network.vnet_anf.name
  address_prefixes     = ["172.16.2.0/24"]

  delegation {
    name = "netapp"

    service_delegation {
      name    = "Microsoft.Netapp/volumes"
      actions = ["Microsoft.Network/networkinterfaces/*", "Microsoft.Network/virtualNetworks/subnets/join/action"]
    }
  }
}