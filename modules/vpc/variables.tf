variable "public_subnet_cidr" {
  description = "name of public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "name of public subnet"
  type        = string
}

variable "icmp_whitelist" {
  description = "list of IP addresses allowed to ICMP to instance"
  type        = list(any)
}

variable "name_of_vpc" {
  description = "variable to give your vpc its unique name in the account"
  type        = string
}

variable "tags" {
  description = "tags for all resources from this module"
  
}