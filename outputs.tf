output "resource_group_id" {
  value     = azurerm_resource_group.rg.id
  sensitive = false
}

output "resource_group_name" {
  value     = azurerm_resource_group.rg.name
  sensitive = false
}

output "vnet_id" {
  value     = azurerm_virtual_network.vnet.id
  sensitive = false
}

output "vnet_guid" {
  value     = azurerm_virtual_network.vnet.guid
  sensitive = false
}

output "subnet_ids" {
  value = { for key, snet in azurerm_subnet.snet : key => snet.id }
}