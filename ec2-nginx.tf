# Template to spin up ec2 instance with nginx installed.

variable "private_key_path"{}

provider "aws"{

/*
* use 'aws configure' to add access keys to your path. terraform will automatically detect these keys.
**/
	access_key = ""
	secret_key = ""
	region = "us-east-1"

}

resource "aws_instance" "nginx"{
	ami = "ami-c58c1dd3"
	instance_type = "t2.micro"

}

connection {
	user = "ec2-user"
	private_key = $(file(var.priavate_key_path))
}