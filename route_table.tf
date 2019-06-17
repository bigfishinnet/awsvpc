resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
  Name = "terraform-sblug-rt"
  }
}

resource "aws_route_table_association" "rta" {
  count = 2

  subnet_id      = "${aws_subnet.subnet.0.id}"
  route_table_id = "${aws_route_table.rt.id}"

}
