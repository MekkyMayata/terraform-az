module "nic-1" {
  source = "./modules/nic/"

  nic_name            = "nic-1"
  location            = var.location
  resource_group_name = "nic-rg"
  subnet_id           = module.vnet-1.subnet[0].id
  public_ip_name      = "public-1"
  nsg_name            = "web-nsg"
}