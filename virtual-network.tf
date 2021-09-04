# virtual network
resource "azurerm_virtual_network" "vnet" {
  name = var.virtual_net_name
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = merge(local.default_tags, {
      Name = var.virtual_net_name
  })
}

resource "azurerm_subnet" "vnet-subnet-1" {
  name = "internal"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = [ "10.0.2.0/24" ]
}

resource "azurerm_public_ip" "node-x-public-ip" {
  name = "pip1"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"
  sku = "Basic"
}

resource "azurerm_network_interface" "nic" {
  name = "nic-x"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.vnet-subnet-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.node-x-public-ip.id
  }
}

resource "azurerm_network_security_group" "sg-1" {
  name = "nsg-1"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule  {
    access = "Allow"
    description = "ssh access"
    destination_port_range = "22"
    direction = "Inbound"
    name = "ssh"
    priority = 1000
    protocol = "TCP"
    source_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
  security_rule  {
    access = "Allow"
    description = "http access"
    destination_port_range = "80"
    direction = "Inbound"
    name = "http"
    priority = 1001
    protocol = "TCP"
    source_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "sg-1" {
  network_interface_id = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.sg-1.id
}