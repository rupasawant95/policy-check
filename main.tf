provider "aws" {
    region = "us-west-2"
}
resource "aws_instance" "terr-inc" {
    ami         = "ami-074be47313f84fa38"
    
    tags = {
    Name = "Sentinel-check"
    }
}

