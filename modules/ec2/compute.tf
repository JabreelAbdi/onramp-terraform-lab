resource "aws_instance" "terraform_labs_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.terraform_icmp_sg.id]
  key_name                    = var.key_name
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = var.tags
  }
}

output "public_ip" {
  value       = aws_instance.terraform_labs_ec2[0].public_ip
  description = "public ip of the instance"
}

resource "aws_security_group" "terraform_icmp_sg" {
  name        = "allow icmp"
  description = "Allow icmp inbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description = "icmp from whitelist"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.icmp_whitelist
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.tags
  }
}