variable "virtual_net_name" {
  type    = string
  default = "myTFVnet"
}

variable "resource_group_name" {
  type    = string
  default = "myTFResourceGroup"
}
variable "location" {
  type    = string
  default = "westus2"
}

locals {
  default_tags = {
    Environment = "dev"
    Team        = "DevOps"
  }
}