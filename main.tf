provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "terr-inc" {
  name        = "terra_security_group"
  description = "Example security group"

  # Define inbound rules
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terr-inc" {
  ami             = "ami-074be47313f84fa38"
  instance_type   = "t2-micro"
  security_groups = [aws_security_group.terr-inc.name]
  tags = {
    Name = "Sentinel-check"
  }
}
