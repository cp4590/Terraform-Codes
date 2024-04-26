resource "azurerm_network_interface" "nic" {
  for_each            = var.linux_vm_map
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  

  ip_configuration {
    name                          = "Internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    
  }
}

resource "azurerm_linux_virtual_machine" "ausclient_linux_vm" {
  for_each                        = var.linux_vm_map
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.rg_name
  size                            = each.value.size
  network_interface_ids           = [data.azurerm_network_interface.nic[each.key].id]
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}



















