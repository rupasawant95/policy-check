provider "aws" {
    region = "us-west-2"
}
resource "aws_instance" "terr-inc" {
    ami         = "ami-074be47313f84fa38"
    instance_type = "t2-medium"
    security_groups = [aws_security_group.terr-inc.name]
    tags = {
    Name = "Sentinel-check"
    }
}
resource "aws_security_group" "terr-inc" {
  name        = "terr-sg"
  description = "security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terr-security-group"
  }
}
