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

variable "instance_type" {
  type        = string
  description = "The instance type to use for the cluster"
  default     = "t3.medium"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to create the cluster in"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The IDs of the subnets to create the cluster in"
}
