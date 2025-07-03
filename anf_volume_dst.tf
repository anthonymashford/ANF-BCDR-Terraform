resource "azurerm_netapp_volume" "anf_volume_dst" {
  depends_on          = [azurerm_netapp_volume.anf_volume_src]
  name                = "anf-lab-volume-dst"
  location            = azurerm_resource_group.anf_bcdr_rg.location
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  pool_name           = azurerm_netapp_pool.anf_pool.name
  subnet_id           = azurerm_subnet.subnet_anf.id
  network_features    = "Standard"
  volume_path         = "anf-lab-volume-dst"
  storage_quota_in_gb = 100
  service_level       = "Standard"
  zone                = "2"

  data_protection_replication {
    endpoint_type             = "dst"
    remote_volume_location    = azurerm_netapp_volume.anf_volume_src.location
    remote_volume_resource_id = azurerm_netapp_volume.anf_volume_src.id
    replication_frequency     = "10minutes"
  }

  lifecycle {
    prevent_destroy = false
  }
}