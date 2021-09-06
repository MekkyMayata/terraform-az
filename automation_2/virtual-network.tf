module "vnet-1" {
  source                  = "./modules/vnet"
  vnet_name               = "hasw-vnet"
  location                = module.dev-rg.azure-rg.location
  resource_group_name     = "dev-rg" # "${local.env_name}-rg"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_names     = ["public_subnet_a"]
  private_subnet_names    = ["private_subnet_a"]
  public_subnet_prefixes  = ["10.0.0.0/24"]
  private_subnet_prefixes = ["10.0.1.0/24"]
}