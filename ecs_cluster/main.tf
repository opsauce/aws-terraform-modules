locals {
  cluster_name = "${var.namespace}-${var.environment}"
}

resource "aws_ecs_cluster" "cluster" {
  name = local.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name        = "${var.namespace} ${title(var.environment)} ECS Cluster"
    Environment = var.environment
  }
}
