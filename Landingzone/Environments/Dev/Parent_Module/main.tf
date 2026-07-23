module "rg" {
  source   = "../../../Modules/Child_Module/1_RG"
  rg_child = var.rg_parent
}

module "storage_acc" {
  depends_on    = [module.rg]
  source        = "../../../Modules/Child_Module/2_STORAGE"
  storage_child = var.storage_parent
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../../Modules/Child_Module/3_VNET"
  vnet_child = var.vnet_parent
}

module "subnet" {
  depends_on   = [module.vnet]
  source       = "../../../Modules/Child_Module/4_SUBNET"
  subnet_child = var.subnet_parent
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../../Modules/Child_Module/5_PIP"
  pip_child  = var.pip_parent
}

module "nsg" {
  depends_on = [module.rg]
  source     = "../../../Modules/Child_Module/6_NSG"
  nsg_child  = var.nsg_parent
}

module "nic" {
  depends_on = [module.subnet,module.pip]
  source     = "../../../Modules/Child_Module/7_NIC"
  nic_child  = var.nic_parent
}

module "vm" {
  depends_on = [module.nic]
  source     = "../../../Modules/Child_Module/8_VM"
  vm_child   = var.vm_parent
}