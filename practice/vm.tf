resource "azurerm_availability_set" "demoset" {
  name                = "demo_availability_set"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_linux_virtual_machine" "node-x" {
  name                  = "node-x"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  size                  = "Standard_F2"
  admin_username        = "adminuser"
  availability_set_id   = azurerm_availability_set.demoset.id
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("${path.module}/utilities/azurevm.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}