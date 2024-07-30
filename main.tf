provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = "us-west-2"
}
resource "aws_instance" "terr-inc" {
    ami         = "ami-074be47313f84fa38"
    instance_type = "t2-micro"
}
