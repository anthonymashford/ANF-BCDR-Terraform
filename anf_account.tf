resource "azurerm_netapp_account" "anf_account" {
  name                = "anf-lab"
  location            = azurerm_resource_group.anf_bcdr_rg.location
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  tags = {
    Environment = "lab"
  }
}
