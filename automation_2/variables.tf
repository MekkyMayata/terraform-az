variable "location" {
  type    = string
  default = "westus2"
}

locals {
#   env_codes = {
#     dev: "dev"
#     stage: "stg"
#   }
#   env_code = local.env_codes[local.env_name]
#   env_name = terraform.workspace
}