variable "namespace" {
  type        = string
  description = "The namespace to use for the resources"
}

variable "task_name" {
  type        = string
  description = "The name of the task"
}

variable "image_repository_url" {
  type        = string
  description = "The URL of the image repository"
}

variable "task_execution_role_arn" {
  type        = string
  description = "The ARN of the task execution role"
}
