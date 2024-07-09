resource "azurerm_resource_group" "rg" {
  #   name     = "${var.identifier}-${var.rg_name}"
  name     = join("-", [var.identifier, var.rg_name])
  location = var.location
  tags     = var.tags
  timeouts {
    create = "10m"
    update = "10m"
    delete = "10m"
  }
}

locals {
  location  = azurerm_resource_group.rg.location
  rg_name   = azurerm_resource_group.rg.name
  vnet_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = join("-", [var.identifier, var.vnet_name])
  location            = local.location
  resource_group_name = local.rg_name
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
}

resource "azurerm_subnet" "snet" {
  for_each             = var.subnets
  name                 = join("-", [var.identifier, each.key])
  virtual_network_name = local.vnet_name
  resource_group_name  = local.rg_name
  address_prefixes     = [each.value.address_prefixes]
}