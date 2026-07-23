resource "azurerm_network_interface" "nic" {
    for_each = var.nic_child
    name = each.value.nic_name
    resource_group_name = each.value.rg_name
    location = each.value.location

    dynamic "ip_configuration" {
        for_each = each.value.ip_configuration
        content {
        name = ip_configuration.value.name
        subnet_id = data.azurerm_subnet.subnet-data[each.key].id
        public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
        private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
    }
}


