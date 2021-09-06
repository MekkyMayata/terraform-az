resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.vpc_cidr]

  tags = {
    name = var.vnet_name
  }
}

resource "azurerm_subnet" "public-subnet" {
  count                = length(var.public_subnet_names)
  name                 = var.public_subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.public_subnet_prefixes[count.index]]
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet" "private-subnet" {
  count                = length(var.private_subnet_names)
  name                 = var.private_subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.private_subnet_prefixes[count.index]]
  virtual_network_name = azurerm_virtual_network.vnet.name
  # Disable network policies for the private link endpoint on the subnet
  enforce_private_link_endpoint_network_policies = true
}