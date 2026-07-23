data "azurerm_subnet" "subnet-data" {
    for_each = var.nic_child
  name                 = each.value.subnet_data_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.rg_name
}