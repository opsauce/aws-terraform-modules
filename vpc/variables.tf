variable "namespace" {
  type        = string
  description = "The namespace to use for the resources"
}

variable "environment" {
  type        = string
  description = "The environment of the cluster"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Allowed values for environment are \"dev\", \"staging\", or \"prod\"."
  }
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"

  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", var.vpc_cidr_block))
    error_message = "The CIDR block must be in the format x.x.x.x/x."
  }
}

variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "The CIDR blocks for the subnets"

  validation {
    condition = length([
      for cidr_block in var.subnet_cidr_blocks : true
      if can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}/\\d{1,2}$", cidr_block))
    ]) == length(var.subnet_cidr_blocks)
    error_message = "All CIDR blocks must be in the format x.x.x.x/x."
  }
}
