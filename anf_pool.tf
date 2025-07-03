resource "azurerm_netapp_pool" "anf_pool" {
  name                = "anf-lab-pool"
  location            = azurerm_resource_group.anf_bcdr_rg.location
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  size_in_tb          = 1
  service_level       = "Standard"
}