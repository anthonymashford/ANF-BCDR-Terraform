resource "azurerm_netapp_backup_vault" "anf_backup_vault" {
  name                = "anf-lab-backup-vault"
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  location            = azurerm_resource_group.anf_bcdr_rg.location
  account_name        = azurerm_netapp_account.anf_account.name
  tags = {
    Environment = "lab"
  }
}