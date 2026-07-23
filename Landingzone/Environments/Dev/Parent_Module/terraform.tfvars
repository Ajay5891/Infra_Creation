rg_parent = {
  rg1 = {
    rg_name  = "dev-rg1"
    location = "East US"
  }
}

storage_parent = {
  storage1 = {
    storage_name             = "devkitijori"
    rg_name                  = "dev-rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  storage2 = {
    storage_name             = "testkitijori"
    rg_name                  = "dev-rg1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }  
}

vnet_parent = {
  vnet1 = {
    vnet_name     = "dev-vnet1"
    rg_name       = "dev-rg1"
    location      = "East US"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_parent = {
  subnet1 = {
    subnet_name      = "Frontend-subnet"
    rg_name          = "dev-rg1"
    vnet_name        = "dev-vnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name      = "Backend-subnet"
    rg_name          = "dev-rg1"
    vnet_name        = "dev-vnet1"
    address_prefixes = ["10.0.2.0/24"]
  }
}

pip_parent = {
  pip1 = {
    pip_name          = "Frontend-pip"
    rg_name           = "dev-rg1"
    location          = "East US"
    allocation_method = "Static"
  }
  pip2 = {
    pip_name          = "Backend-pip"
    rg_name           = "dev-rg1"
    location          = "East US"
    allocation_method = "Static" 
  }
}

nsg_parent = {
  nsg1 = {
    nsg_name = "dev-nsg1"
    rg_name  = "dev-rg1"
    location = "East US"

    security_rule = {
      rule1 = {
        name                       = "AllowSSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

nic_parent = {
  nic1 = {
    nic_name             = "Frontend-nic"
    rg_name              = "dev-rg1"
    location             = "East US"
    pip-data-name        = "Dynamic"
    subnet_data_name     = "data-subnet1"
    virtual_network_name = "dev-vnet1"

    ip_configuration = {
      ip_configuration = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }
  }
  nic2 = {
    nic_name             = "Backend-nic"
    rg_name              = "dev-rg1"
    location             = "East US"
    pip-data-name        = "Dynamic"
    subnet_data_name     = "data-subnet2"
    virtual_network_name = "dev-vnet1"

    ip_configuration = {
      ip_configuration = {
        name                          = "ipconfig2"
        private_ip_address_allocation = "Dynamic"
      }
    }    
  }
}

vm_parent = {
  vm1 = {
    vm_name        = "Frontend-vm"
    rg_name        = "dev-rg1"
    location       = "East US"
    size           = "Standard_D4_v5"
    admin_username = "adminuser"
    admin_password = "Admin@123#"
    nic_name       = "dev-nic1"
    disk = {
      disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    image_reference = {
      image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
  }
  vm2 = {
    vm_name        = "Backend-vm"
    rg_name        = "dev-rg1"
    location       = "East US"
    size           = "Standard_D4_v5"
    admin_username = "adminuser"
    admin_password = "Admin@123#"
    nic_name       = "dev-nic1"
    disk = {
      disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    image_reference = {
      image = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }    
  }
}