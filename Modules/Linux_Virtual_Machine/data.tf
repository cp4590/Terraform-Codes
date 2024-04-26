data "azurerm_subnet" "datasubnet" {
  for_each             = var.linux_vm_map
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}



data "azurerm_network_interface" "nic" {
  for_each            = var.linux_vm_map
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}
data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = "/subscriptions/21f2456b-e023-4fff-8f50-b6e1ebe99db4/resourceGroups/medicity-rg/providers/Microsoft.KeyVault/vaults/cpkakayvault"
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = "/subscriptions/21f2456b-e023-4fff-8f50-b6e1ebe99db4/resourceGroups/medicity-rg/providers/Microsoft.KeyVault/vaults/cpkakayvault"
}
