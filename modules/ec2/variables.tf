variable "ami" {
  description = "the ami for the ec2 you are using"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "name of the ssh key that was created on the console"
  type        = string
}

variable "tags" {
  description = "Tag for EC2 instance"
  type        = string
}

variable "icmp_whitelist" {
  description = "list of IP addresses allowed to ICMP to instance"
  type        = list(any)
}

variable "vpc_id" {
  
}

variable "subnet_id" {
  
}