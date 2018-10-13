provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}

resource "aws_instance" "example" {
#  ami           = "ami-2757f631"

/***
** changing ami from ubnutu 16.04 LTS to ubuntu 16.10 AMI 
***/
  ami		= "ami-b374d5a5"
  instance_type = "t2.micro"
}
