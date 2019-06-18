resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr-block}"
  enable_dns_hostnames = true

  tags = {
  Name = "terraform-test-sblug-vpc"
  }
}
