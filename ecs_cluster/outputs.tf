output "cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "vpc_security_group_ids" {
  value = aws_security_group.ecs_security_group.id
}
