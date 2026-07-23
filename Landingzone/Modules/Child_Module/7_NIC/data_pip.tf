data "azurerm_public_ip" "pip-data" {
    for_each = var.nic_child
name = each.value.pip-data-name
resource_group_name = each.value.rg_name
}