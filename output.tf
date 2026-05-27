output "rg_details" {
  description = "Details of created resource groups"
  value = {
    for k, v in azurerm_resource_group.this :
    k => {
      rg_id    = v.id
      rg_name  = v.name
      location = v.location
      tags     = v.tags
    }
  }
}