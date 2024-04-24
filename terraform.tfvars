rg_map = {
  Rg1 = {
    name     = "medicity-rg",
    location = "East US"
  }
}

vnet_map = {
  Vnet1 = {
    name          = "medicity-vnet",
    location      = "East US",
    rg_name       = "medicity-rg",
    address_space = ["10.0.0.0/16"]
  }
}

subnet_map = {
  subnet1 = {
    subnet_name      = "medicity-frontend-subnet",
    rg_name          = "medicity-rg",
    vnet_name        = "medicity-vnet",
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name      = "medicity-backend-subnet",
    rg_name          = "medicity-rg",
    vnet_name        = "medicity-vnet",
    address_prefixes = ["10.0.2.0/24"]
  }

}

linux_vm_map = {
  vm1 = {
    vm_name     = "medicity-frontend-vm",
    subnet_name = "medicity-frontend-subnet",
    nic_name    = "nic1",
    size        = "Standard_B1s",
    rg_name     = "medicity-rg",
    location    = "East US",
    vnet_name   = "medicity-vnet",
  }
  vm2 = {
    vm_name     = "medicity-backend-vm",
    subnet_name = "medicity-backend-subnet",
    nic_name    = "nic2",
    size        = "Standard_B1s",
    rg_name     = "medicity-rg",
    location    = "East US",
    vnet_name   = "medicity-vnet",
  }

}

linux_nic_map = {
  nic1 = {
    subnet_name = "medicity-frontend-subnet"
    vnet_name   = "medicity-vnet"
    rg_name     = "medicity-rg"
    nic_name    = "nic1"
    location    = "east US"
  }
  nic2 = {
    subnet_name = "medicity-backend-subnet"
    vnet_name   = "medicity-vnet"
    rg_name     = "medicity-rg"
    nic_name    = "nic2"
    location    = "east US"
  }

}