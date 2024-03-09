## Requirements

| Name                                                                      | Version |
| ------------------------------------------------------------------------- | ------- |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | ~> 5.0  |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 0.14 |

## Providers

| Name                                              | Version |
| ------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                               | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------- |
| [aws_autoscaling_group.autoscaling_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group)                           | resource    |
| [aws_ecs_capacity_provider.capacity_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider)                   | resource    |
| [aws_ecs_cluster.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster)                                                    | resource    |
| [aws_ecs_cluster_capacity_providers.capacity_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster_capacity_providers) | resource    |
| [aws_iam_instance_profile.ecs_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile)                             | resource    |
| [aws_iam_role.ecs_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                                     | resource    |
| [aws_iam_role_policy_attachment.ecs_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment)                 | resource    |
| [aws_launch_configuration.ecs_launch_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration)                     | resource    |
| [aws_security_group.ecs_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                                | resource    |
| [aws_ami.amazon_linux_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                                       | data source |
| [aws_iam_policy_document.ecs_agent](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)                            | data source |

## Inputs

| Name                                                                        | Description                              | Type           | Default       | Required |
| --------------------------------------------------------------------------- | ---------------------------------------- | -------------- | ------------- | :------: |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name)    | The name of the ECS cluster              | `string`       | n/a           |   yes    |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use for the cluster | `string`       | `"t3.medium"` |    no    |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids)          | The IDs of the subnets for the cluster   | `list(string)` | n/a           |   yes    |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)                      | The ID of the VPC for the cluster        | `string`       | n/a           |   yes    |

## Outputs

| Name                                                                                                         | Description                                          |
| ------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------- |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name)                                   | The name of the ECS cluster                          |
| <a name="output_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#output\_vpc\_security\_group\_ids) | The security group IDs for the ECS cluster instances |
