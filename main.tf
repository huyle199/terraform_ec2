terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}


module "ec2_instance" {
  source                 = "./module/ec2/"
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.micro"
  key_name               = "open"
  vpc_security_group_ids = module.security.security_ec2
  user_data              = file("./script.txt")
  tags = {
    Name = "Ec2_web"
  }
}

module "security" {
  source = "./security"
}