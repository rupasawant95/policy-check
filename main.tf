provider "aws" {
    region = "us-west-2"
}
resource "aws_instance" "terr-inc" {
    ami         = "ami-074be47313f84fa38"
    instance_type = "t2-medium"
    tags = {
    Name = "Sentinel-check"
    }
}
resource "aws_security_group" "sg-group" {
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port    = 22
    to_port      = 22
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress {
    from_port    = 8200
    to_port      = 8200
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
   tags = {
    Name = "sg-group"
  }
}

