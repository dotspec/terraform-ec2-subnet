variable "subnet_vpc_id" { }
variable "subnet_cidrs" { type = "list" }
variable "subnet_pub_ip" { default = false }
variable "subnet_azs" { type = "list" }
variable "tag_name" { }

resource "aws_subnet" "ec2_subnet" {
  vpc_id                  = "${var.subnet_vpc_id}"
  availability_zone       = "${var.subnet_azs[count.index]}"
  cidr_block              = "${var.subnet_cidrs[count.index]}"
  map_public_ip_on_launch = "${var.subnet_pub_ip}"
  count                   = "${length(var.subnet_cidrs)}"

  tags {
    Name = "${var.tag_name}-${element(var.subnet_azs, count.index)}"
  }
}
