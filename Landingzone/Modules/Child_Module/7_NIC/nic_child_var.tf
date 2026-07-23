variable "nic_child" {
  type = map(object({
    nic_name             = string
    rg_name              = string
    location             = string
    subnet_data_name     = string
    virtual_network_name = string
    pip-data-name        = string
    ip_configuration = map(object({
      name                         = string
      private_ip_address_allocation = string
    }))

  }))
}
