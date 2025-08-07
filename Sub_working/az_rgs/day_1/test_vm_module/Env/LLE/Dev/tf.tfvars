rg_name = {
  name     = "dev_rg"
  location = "west_us"
}

vnets = {
  name                = "dev_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "west_us"
  resource_group_name = "dev_rg"
}

subnets = {
  name                 = "dev_subnet"
  resource_group_name  = "dev_rg"
  virtual_network_name = "dev_vnet"
  address_prefixes     = ["10.0.2.0/24"]
}

nics = {
  name                 = "dev_nic"
  location             = "west_us"
  resource_group_name  = "dev_rg"
  subnet_name          = "dev_subnet"
  virtual_network_name = "dev_vnet"
  public_ip_name       = "dev_pips"
}

pips = {
  name                = "dev_pip"
  resource_group_name = "dev_rg"
  location            = "west_us"
  allocation_method   = "Static"
}

nsgs = {
  name                = "dev_nsg"
  location            = "west_us"
  resource_group_name = "dev_rg"
}

security = {
  name                       = "test123"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
nsgass = {
  name        = "dev_nsgass"
  subnet_name = "dev_subnet"
}

vms = {
  name                = "dev_vm"
  resource_group_name = "dev_rg"
  location            = "west_us"
  size                = "Standard_F2"
  admin_username      = "rmsingh@123"
  admin_passwd        = "logo@123!_12"
  nic_name            = "dev_nic"
  resource_group_name = "dev_rg"

}
