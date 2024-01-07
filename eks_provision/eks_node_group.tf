resource "aws_eks_node_group" "eks_cluster_primary" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "primary"
  node_role_arn   = aws_iam_role.worker_node.arn
  subnet_ids      = aws_subnet.private_subnets.*.id
  instance_types  = ["t3.large"]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.worker_node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.worker_node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
