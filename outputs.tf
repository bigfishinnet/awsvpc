# Removed output as a list for vpc_id
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "subnet_ids" {
  value = "${aws_subnet.subnet.0.id}"
}

# output "igw" {
#     value = aws_internet_gateway.stephen-igw.
# }

output "sg_id" {
  value = ["${aws_security_group.sg.id}"]
}

