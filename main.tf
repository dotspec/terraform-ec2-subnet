variable "subnet_vpc_id" { }
variable "subnet_cidr_block" { }
variable "subnet_pub_ip" { default = false }
variable "subnet_az" { }

resource "aws_subnet" "ec2_subnet" {
  vpc_id                  = "${subnet_vpc_id}"
  availability_zone       = "${subnet_az}"
  cidr_block              = "${subnet_cidr_block}"
  map_public_ip_on_launch = "${subnet_pub_ip}"
}
