variable "vm_child" {
  type = map(object({
    vm_name = string
    rg_name = string
    location = string
    size = string
    admin_username = string
    admin_password = string
    nic_name = string
    disk = map(object({
      caching = string
      storage_account_type = string
    }))
    image_reference = map(object({
      publisher = string
      offer = string
      sku = string
      version = string
    }))

  }))
}