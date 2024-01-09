resource "aws_vpc" "custom" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.namespace}-${var.environment}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "subnet" {
  count                   = length(var.subnet_cidr_blocks)
  vpc_id                  = aws_vpc.custom.id
  cidr_block              = element(var.subnet_cidr_blocks, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name        = "${format("${var.namespace}-${var.environment}-vpc-publicsubnet-%d", count.index + 1)}"
    Environment = var.environment
  }
}
