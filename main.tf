resource "azurerm_resource_group" "this" {
  for_each = var.rgdetails
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
  managed_by = each.value.managed_by
}