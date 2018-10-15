variable "private_key_path" {}

variable "network_address_space"{
	default = "10.1.0.0/16"
}

variable "subnet1_address_space"{
	default = "10.1.0.0/24"
}

variable "subnet2_address_space"{
	default = "10.1.1.0/24"
}

provider "aws"{
	access_key = ""
	secret_key = ""
	region = "us-ease-1"

}
#check for availability zones in specified region.
data "aws_availability_zones" "available" {}

/**
* RESOURCES
*/
resource "aws_vpc" "vpc"{
	cidr_block = "${var.network_address_space}"
	enable_dns_hostnames = "true"

}
resource "aws_internet_gateway" "igw"
{
	vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_subnet" "subnet1"{
	cidr_block = "${var.subnet1_address_space}"
	vpc_id = "${aws_vpc.vpc.id}"
	map_public_ip_on_launch = "true"
	availability_zone = "${data.aws_availability_zones.available.names[0]}"

}

resource "aws_subnet "subnet2"
{
	cidr_block = "${var.subnet2_address_space}"
	vpc_id = "${aws_vpc.vpc.id}"
	map_public_ip_on_launch = "true"
	availability_zone = "${data.aws_availability_zones.available.names[1]}"

}

/**
*Routing
*/


