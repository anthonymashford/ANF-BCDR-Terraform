resource "azurerm_netapp_backup_policy" "anf_backup_policy" {
  name                    = "anf-lab-backup-policy"
  resource_group_name     = azurerm_resource_group.anf_bcdr_rg.name
  location                = azurerm_resource_group.anf_bcdr_rg.location
  account_name            = azurerm_netapp_account.anf_account.name
  enabled                 = true
  daily_backups_to_keep   = 7
  weekly_backups_to_keep  = 4
  monthly_backups_to_keep = 12

  tags = {
    Environment = "lab"
  }
}