resource "aws_eip" "nat_gateway" {
  domain = "vpc"

  tags = {
    Name = "${var.namespace}-eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 0)
  depends_on    = [aws_internet_gateway.internet_gateway]
  tags = {
    Name = "${var.namespace}-ngw"
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
