resource "azurerm_network_interface" "windownic" {
  for_each            = var.window_vm_map
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_windows_virtual_machine" "windowvm" {
  for_each              = var.window_vm_map
  name                  = each.value.vm_name
  computer_name = each.value.computer_name
  resource_group_name   = each.value.rg_name
  location              = each.value.location
  size                  = "Standard_F2"
  admin_username        = data.azurerm_key_vault_secret.username.value
  admin_password        = data.azurerm_key_vault_secret.password.value
  network_interface_ids = [azurerm_network_interface.windownic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}