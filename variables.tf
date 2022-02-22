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
  type        = list
}

variable "key_name" {
  description = "name of the ssh key that was created on the console"
  type        = string 
}