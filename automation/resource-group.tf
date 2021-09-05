module "network-rg" {
  source = "./modules/resource-groups/"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "nic-rg" {
  source = "./modules/resource-groups/"

  resource_group_name = "nic-rg"
  location            = var.location
}