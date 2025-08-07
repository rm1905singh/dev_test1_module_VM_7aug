resource "azurerm_network_interface" "nic_block" {
  for_each            = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = data.azurerm_subnet.subnet_data_block[each.key].id
    private_ip_address_allocation = "Dynamic"
    private_ip_address            = data.azurerm_public_ip.pip_data_block[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip_data_block[each.key].id
  }
}
