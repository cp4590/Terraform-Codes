module "Resource_group" {
  source = "../../Modules/Resource_Group"
  rg_map = var.rg_map
}

module "Virtual_natwork" {
  source     = "../../Modules/Virtual_Network"
  vnet_map   = var.vnet_map
  depends_on = [module.Resource_group]
}

module "Subnet" {
  source     = "../../Modules/Subnet"
  subnet_map = var.subnet_map
  depends_on = [module.Resource_group, module.Virtual_natwork]
}
module "Linux_Network_interface" {
  source        = "../../Modules/network_Interface"
  linux_nic_map = var.linux_nic_map
  depends_on    = [module.Subnet]
}



module "Linux_Virtual_Machine" {
  source       = "../../Modules/Virtual_Machine"
  linux_vm_map = var.linux_vm_map
  depends_on   = [module.Linux_Network_interface]
}

