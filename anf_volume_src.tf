resource "azurerm_netapp_volume" "anf_volume_src" {
  depends_on          = [azurerm_netapp_snapshot_policy.anf_snapshot_policy]
  name                = "anf-lab-volume-src"
  location            = azurerm_resource_group.anf_bcdr_rg.location
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  pool_name           = azurerm_netapp_pool.anf_pool.name
  subnet_id           = azurerm_subnet.subnet_anf.id
  network_features    = "Standard"
  volume_path         = "anf-lab-volume-src"
  storage_quota_in_gb = 100
  service_level       = "Standard"
  zone                = "1"

  data_protection_snapshot_policy {
    snapshot_policy_id = azurerm_netapp_snapshot_policy.anf_snapshot_policy.id
  }

  data_protection_backup_policy {
    backup_policy_id = azurerm_netapp_backup_policy.anf_backup_policy.id
    backup_vault_id  = azurerm_netapp_backup_vault.anf_backup_vault.id
    policy_enabled   = true
  }

  lifecycle {
    prevent_destroy = false
  }
}