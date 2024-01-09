resource "aws_ecs_task_definition" "task_definition" {
  family             = var.task_name
  execution_role_arn = var.task_execution_role_arn
  container_definitions = jsonencode([
    {
      name  = var.task_name
      image = var.ecr_repository_url
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "ecs/${var.namespace}/${var.task_name}"
          "awslogs-region"        = "eu-west-2"
          "awslogs-create-group"  = "true"
          "awslogs-stream-prefix" = "ecs"
        }
      }
      memoryReservation = 128
      essential         = true
      portMappings      = var.port_mappings
    }
  ])
}
