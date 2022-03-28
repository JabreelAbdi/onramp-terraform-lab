variable "vpc_cidr" {
  description = "name of public subnet"
  type        = string
}
variable "public_subnet_name" {
  description = "name of public subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "name of public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR range of public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR range of private subnet"
  type        = string
}

variable "name_of_vpc" {
  description = "variable to give your vpc its unique name in the account"
  type        = string
}

variable "tags" {
  description = "tags for all resources from this module"

}