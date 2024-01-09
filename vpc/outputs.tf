output "vpc_id" {
  value = aws_vpc.custom.id
}

output "subnet_ids" {
  value = aws_subnet.subnet.*.id
}
