resource "azurerm_subnet" "aussubnet" {
  for_each             = var.subnet_map
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
  address_prefixes     = each.value.address_prefixes
}