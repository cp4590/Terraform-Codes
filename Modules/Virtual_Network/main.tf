resource "azurerm_virtual_network" "Vnet" {
  for_each            = var.vnet_map
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space
}