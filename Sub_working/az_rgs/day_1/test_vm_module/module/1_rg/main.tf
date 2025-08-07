resource "azurerm_resource_group" "rg_block" {
  for_each = var.rg_name
  name     = each.value.rg_name
  location = each.value.rg_name

  tags = {
    environment = "dev"
  }
}



