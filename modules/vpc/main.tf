resource "aws_vpc" "terraform_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = var.name_of_vpc
  }
}