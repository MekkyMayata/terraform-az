module "vnet-1" {
  source              = "./modules/vnet"
  vnet_name           = "vnet-x"
  location            = module.network-rg.location
  resource_group_name = var.resource_group_name
  vpc_cidr            = "10.0.0.0/16"
  subnet_names        = ["subnet-a", "subnet-b"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24"]
}

