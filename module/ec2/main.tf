resource "aws_instance" "web_ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security
  key_name = var.key_name

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_key_pair" "key" {
    key_name = var.key_pair

  
}
