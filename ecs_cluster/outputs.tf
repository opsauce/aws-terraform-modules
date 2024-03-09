output "cluster_name" {
  value       = aws_ecs_cluster.main.name
  description = "The name of the ECS cluster"
}

output "vpc_security_group_ids" {
  value       = aws_security_group.ecs_security_group.id
  description = "The security group IDs for the ECS cluster instances"
}
