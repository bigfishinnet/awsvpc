resource "aws_subnet" "subnet" {
  count = 1
  cidr_block        = "${cidrsubnet("${var.cidr-block}", 8, count.index)}"
  vpc_id            = "${aws_vpc.vpc.id}"

  tags = {
  Name = "terraform-sblug-subnet"
  }
}

resource "aws_security_group" "sg" {
  name        = "${aws_vpc.vpc.id}-sg"
  description = "Security group for all EC2 in the VPC"
  vpc_id      = "${aws_vpc.vpc.id}"
  tags = {
  Name = "terraform-sblug-sg"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}