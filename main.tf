variable "subnet_vpc_id" { }
variable "subnet_cidr_block" { }
variable "subnet_pub_ip" { default = false }
variable "subnet_az" { }

resource "aws_subnet" "ec2_subnet" {
  vpc_id                  = "${var.subnet_vpc_id}"
  availability_zone       = "${var.subnet_az}"
  cidr_block              = "${var.subnet_cidr_block}"
  map_public_ip_on_launch = "${var.subnet_pub_ip}"
}
