resource "aws_iam_instance_profile" "ecs_agent" {
  name = "ecs-agent-${var.namespace}-${var.environment}"
  role = aws_iam_role.ecs_agent.name
}

resource "aws_launch_configuration" "ecs_launch_config" {
  image_id             = data.aws_ami.amazon_linux_2.id
  iam_instance_profile = aws_iam_instance_profile.ecs_agent.name
  security_groups      = [aws_security_group.ecs_security_group.id]
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=${local.cluster_name} >> /etc/ecs/ecs.config"
  instance_type        = var.instance_type

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [image_id]
  }
}
