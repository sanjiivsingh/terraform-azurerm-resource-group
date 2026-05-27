resource "azurerm_resource_group" "this" {
  for_each = var.rgdetails
  name     = each.value.rg_name
  location = each.value.location
  tags     = each.value.tags
}