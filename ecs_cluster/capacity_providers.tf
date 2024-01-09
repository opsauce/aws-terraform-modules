resource "aws_ecs_cluster_capacity_providers" "capacity_provider" {
  cluster_name       = aws_ecs_cluster.cluster.name
  capacity_providers = [aws_ecs_capacity_provider.capacity_provider.name]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = aws_ecs_capacity_provider.capacity_provider.name
  }
}

resource "aws_ecs_capacity_provider" "capacity_provider" {
  name = "${var.namespace}-${var.environment}-ecs-capacity-provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.autoscaling_group.arn
  }
}
