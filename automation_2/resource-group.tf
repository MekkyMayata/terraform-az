module "dev-rg" {
  source = "./modules/resource-groups/"

  resource_group_name = "dev-rg" # "${local.env_name}-rg"
  location            = var.location
}
