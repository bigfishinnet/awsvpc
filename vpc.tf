resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true
    
    # tags = "${merge(
    #   local.default_tags,
    #   map("Name", "${local.common_name_prefix}"),
    # )}"
}