provider "aws" {
  region = "us-west-2"
}


resource "aws_instance" "terr-inc" {
  ami             = "ami-074be47313f84fa38"
  instance_type   = "t2.small"
  tags = {
    Name = "Sentinel-check"
  }
}

resource "aws_security_group" "terr-inc" {
  description = "Example security group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
continuous_validation_check = rule {
    all ec2_instances as _, instance {
        instance.change.after.instance_type is "t2.small" or instance.change.after.instance_type is "t2.medium"
    }
}
main = rule {
    continuous_validation_check
}
  tags = {
    Name = "terra_security_group"
  }
}
