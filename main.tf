provider "aws" {
    region  = "us-west-2"
}

resource "aws_instance" "terr-inc" {
    ami         = "ami-074be47313f84fa38"
    instance_type = "t2-micro"
}
