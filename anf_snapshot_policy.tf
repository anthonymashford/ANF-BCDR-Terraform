resource "azurerm_netapp_snapshot_policy" "anf_snapshot_policy" {
  name                = "anf-lab-snapshot-policy"
  location            = azurerm_resource_group.anf_bcdr_rg.location
  resource_group_name = azurerm_resource_group.anf_bcdr_rg.name
  account_name        = azurerm_netapp_account.anf_account.name
  enabled             = true

  hourly_schedule {
    snapshots_to_keep = 12
    minute            = 0
  }

  daily_schedule {
    snapshots_to_keep = 7
    hour              = 0
    minute            = 15
  }

  weekly_schedule {
    snapshots_to_keep = 4
    days_of_week      = ["Sunday"]
    hour              = 0
    minute            = 30
  }

  monthly_schedule {
    snapshots_to_keep = 12
    days_of_month     = [1]
    hour              = 0
    minute            = 45
  }
}