resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = "${var.namespace}-${var.environment}-ecs-asg"
  vpc_zone_identifier       = var.subnet_ids
  launch_configuration      = aws_launch_configuration.ecs_launch_config.name
  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"

  lifecycle {
    create_before_destroy = true
  }
}
