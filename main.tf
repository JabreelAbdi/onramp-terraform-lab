resource "aws_vpc" "terraform_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "terrafrom lab vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "192.168.0.0/17"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "192.168.128.0/17"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_lab_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public RT"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "terraform_icmp_sg" {
  name        = "allow icmp"
  description = "Allow icmp inbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description = "icmp from my ip"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["79.67.176.243/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_icmp"
  }
}