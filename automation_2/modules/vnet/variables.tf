variable "vnet_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_names" {
  type = list(string)
}

variable "public_subnet_prefixes" {
  type = list(string)
}

variable "private_subnet_names" {
  type = list(string)
}

variable "private_subnet_prefixes" {
  type = list(string)
}
