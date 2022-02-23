# module "first_vpc_module" {
#   source = "./modules/vpc"

#   icmp_whitelist      = ["0.0.0.0/32"]
#   public_subnet_cidr  = "192.168.0.0/18"
#   private_subnet_cidr = "192.168.64.0/18"
#   name_of_vpc         = "test module vpc"
#   tags                = "development"
# }

# module "first_ec2_module" {
#   source = "./modules/ec2"

#   ami           = "ami-0bf84c42e04519c85"
#   instance_type = "t2.micro"
#   key_name      = "ta-lab-ansible-key"
#   tags          = "dev ec2 module"
# }

# module "second_vpc_module" {
#   source = "./modules/vpc"

#   icmp_whitelist      = ["0.0.0.0/32"]
#   public_subnet_cidr  = "192.168.0.0/18"
#   private_subnet_cidr = "192.168.64.0/18"
#   name_of_vpc         = "test module vpc"
#   tags                = "production"
# }

# module "second_ec2_module" {
#   source = "./modules/ec2"

#   ami           = "ami-0bf84c42e04519c85"
#   instance_type = "t2.micro"
#   key_name      = "ta-lab-ansible-key"
#   tags          = "test ec2 module"
# }