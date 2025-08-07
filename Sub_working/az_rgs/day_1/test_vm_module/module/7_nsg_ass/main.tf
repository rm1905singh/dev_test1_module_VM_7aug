resource "azurerm_subnet_network_security_group_association" "nsgas_block" {
  for_each                  = var.nsgass
  subnet_id                 = data.azurerm_subnet.subnet_data_block[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgas_data_block[each.key].id
}
