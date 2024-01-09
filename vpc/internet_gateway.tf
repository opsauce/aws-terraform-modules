resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.custom.id

  tags = {
    Name        = "${var.namespace}-${var.environment}-igq"
    Environment = var.environment
  }
}
