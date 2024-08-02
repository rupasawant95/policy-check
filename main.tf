provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "terr-inc" {
  ami             = "ami-074be47313f84fa38"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.terr-inc.name]
  tags = {
    Name = "Sentinel-check"
  }
}
