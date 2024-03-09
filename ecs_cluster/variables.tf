variable "cluster_name" {
  type        = string
  description = "The name of the ECS cluster"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use for the cluster"
  default     = "t3.medium"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC for the cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The IDs of the subnets for the cluster"
}
