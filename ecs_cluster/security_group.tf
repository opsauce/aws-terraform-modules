resource "aws_security_group" "ecs_security_group" {
  name        = "${aws_ecs_cluster.main.name}-ecs-security-group"
  description = "Controls network access to/from the ECS cluster instances"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow inbound traffic to the ECS cluster"
    from_port        = 32768
    to_port          = 65535
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
