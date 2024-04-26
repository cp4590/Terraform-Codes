resource "azurerm_subnet" "bastion-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "medicity-rg"
  virtual_network_name = "medicity-vnet"
  address_prefixes     = ["10.0.5.0/27"]
}

resource "azurerm_public_ip" "bastion-pip" {
  name                = "bastion-pip"
  location            = "east US"
  resource_group_name = "medicity-rg"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  name                = "medicity-bastion"
  location            = "East US"
  resource_group_name = "medicity-rg"
  copy_paste_enabled  = true
  sku                 = "Standard"
  ip_connect_enabled  = true
  scale_units         = "3"

  ip_configuration {
    name                 = "bastion-pip"
    subnet_id            = azurerm_subnet.bastion-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-pip.id

  }
}
