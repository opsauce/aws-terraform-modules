data "aws_caller_identity" "current" {}

locals {
  arn_components = split(":", data.aws_caller_identity.current.arn)
}

output "config_map_aws_auth" {
  description = "AWS authentication configuration map"
  value = templatefile("${path.module}/templates/config_map_aws_auth.tpl", {
    role_arn      = aws_iam_role.worker_node.arn
    user_arn      = data.aws_caller_identity.current.arn
    user_username = local.arn_components[length(local.arn_components) - 1]
  })
}
