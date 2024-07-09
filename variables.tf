variable "rg_name" {
  type        = string
  description = "resource group name"
  default     = "rg-virtual-network"
}

variable "location" {
  type        = string
  description = "location of the resource group"
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "tags for the resource group"
  default = {
    Env = "sbx"
  }
}

variable "identifier" {
  type        = string
  description = "common identifier for all resource names"
  default     = "001"
}

variable "vnet_name" {
  type        = string
  description = "name of the virtual network name"
  default     = "vnet"
}

variable "address_space" {
  type        = string
  description = "address space allocated to the virtual network"
  default     = "10.0.0.0/16"
}

variable "dns_servers" {
  type        = list(string)
  description = "dns server ip addresses"
  default     = ["10.0.0.4", "10.0.0.5"]
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = string
  }))
  description = "subnet configuration"
  default = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = "10.0.1.0/24"
    },
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = "10.0.2.0/24"
    }
  }
}