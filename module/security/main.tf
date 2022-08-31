#security - main.tf

resource "aws_security_group" "security_ec2" {
  name        = "security_ec2"
  description = "HTTP Access"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.cidr_blocks]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.cidr_blocks]
  }

  tags = {
    Name = "security_ec2"
  }
}
