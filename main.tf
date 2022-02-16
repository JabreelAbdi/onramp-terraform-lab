resource "aws_vpc" "terraform-vpc" {
  cidr_block = "192.168.0.0/16" 
  tags = {
    Name = "terrafrom lab vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "192.168.0.0/17"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = "192.168.128.0/17"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform-vpc.id

  tags = {
    Name = "terraform lab igw"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.terraform-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public RT"
  }
}

resource "aws_route_table_association" "public-rt-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-rt.id
}