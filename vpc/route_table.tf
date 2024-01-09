resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_vpc.custom.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "route_table_association" {
  count          = length(aws_subnet.subnet)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_vpc.custom.default_route_table_id
}
