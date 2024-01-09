variable "namespace" {
  type        = string
  description = "The namespace to use for the resources"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"

  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", var.vpc_cidr_block))
    error_message = "The CIDR block must be in the format x.x.x.x/x."
  }
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets"

  validation {
    condition = length([
      for cidr_block in var.private_subnet_cidr_blocks : true
      if can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", cidr_block))
    ]) == length(var.private_subnet_cidr_blocks)
    error_message = "All CIDR blocks must be in the format x.x.x.x/x."
  }
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the public subnets"

  validation {
    condition = length([
      for cidr_block in var.public_subnet_cidr_blocks : true
      if can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", cidr_block))
    ]) == length(var.public_subnet_cidr_blocks)
    error_message = "All CIDR blocks must be in the format x.x.x.x/x."
  }
}
