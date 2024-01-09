variable "namespace" {
  type        = string
  description = "The namespace to use for the resources"
}

variable "task_name" {
  type        = string
  description = "The name of the task"
}

variable "ecr_repository_url" {
  type        = string
  description = "The ECR reposityory URL of the image"
}

variable "task_execution_role_arn" {
  type        = string
  description = "The ARN of the task execution role"
}

variable "port_mappings" {
  type = list(object({
    container_port = number
    host_port      = number
  }))
  description = "List of container and host ports for port mapping"
  default     = []
}
