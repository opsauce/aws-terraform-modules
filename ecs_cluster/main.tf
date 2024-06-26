terraform {
  required_providers {
    terraform = {
      source  = "hashicorp/terraform"
      version = "~> 0.14"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_ecs_cluster" "main" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
