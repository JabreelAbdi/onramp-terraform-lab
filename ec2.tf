resource "aws_instance" "terraform_labs_ec2" {
  ami                    = "ami-0bf84c42e04519c85"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.terraform_icmp_sg.id]
  key_name               = "ta-lab-ansible-key"
  associate_public_ip_address = true

  tags = {
    Name = "public instance"
  }
}

output "public_ip" {
  value       = aws_instance.terraform_labs_ec2.public_ip
  description = "public ip of the instance"
}