resource "aws_subnet" "subnet" {
  count = 1
  cidr_block        = "${cidrsubnet("${var.cidr_block}", 8, count.index)}"
  vpc_id            = "${aws_vpc.vpc.id}"

  # tags = "${merge(
  #     local.default_tags,
  #     map("Name", "${local.common_name_prefix}"),
  #   )}"
}

resource "aws_security_group" "allow_all" {
  name        = "node-${var.environment}-sg"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${aws_vpc.vpc.id}"

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