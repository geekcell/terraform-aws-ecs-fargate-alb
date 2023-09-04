<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/.github/main/geekcell-github-banner.png)](https://www.geekcell.io/)

<!--
Replace the GitHub Repo name and comment in these badges if they BridgeCrew is enabled for this repository.

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-module-template)](https://github.com/geekcell/terraform-aws-module-template/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-module-template?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-module-template/releases)
[![Release](https://github.com/geekcell/terraform-aws-module-template/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-module-template/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-module-template/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-module-template/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-module-template/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-module-template/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-module-template/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-module-template&benchmark=FEDRAMP+%28MODERATE%29)

-->



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Image to create task definition with. | `string` | `"public.ecr.aws/docker/library/nginx:1.23-alpine"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Name of container to create task definition with. | `string` | `"nginx"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Port to create task definition with. | `number` | `80` | no |
| <a name="input_container_protocol"></a> [container\_protocol](#input\_container\_protocol) | Protocol to create task definition with. | `string` | `"tcp"` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | Maximum deployment percent. Usually double minimum to allow rolling deployment. | `number` | `200` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | Minimum deployment percent. Usually set to 100 to ensure at least one task. | `number` | `100` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | Number of desired Fargate tasks. | `number` | `1` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Allow execution commands on containers. | `bool` | `true` | no |
| <a name="input_enable_http_to_https_redirect"></a> [enable\_http\_to\_https\_redirect](#input\_enable\_http\_to\_https\_redirect) | Enable port 80 redirect to 443. | `bool` | `false` | no |
| <a name="input_enable_security_group"></a> [enable\_security\_group](#input\_enable\_security\_group) | Enable default security group. | `bool` | `true` | no |
| <a name="input_enable_security_group_default_http_https_rule"></a> [enable\_security\_group\_default\_http\_https\_rule](#input\_enable\_security\_group\_default\_http\_https\_rule) | Enable default security group rules for port 80 & 443. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to use for components. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the created resources. | `map(any)` | `{}` | no |
| <a name="input_task_additional_execute_role_policies"></a> [task\_additional\_execute\_role\_policies](#input\_task\_additional\_execute\_role\_policies) | Additional policy ARNs to attach to the execution role. | `list(string)` | `[]` | no |
| <a name="input_task_additional_task_role_policies"></a> [task\_additional\_task\_role\_policies](#input\_task\_additional\_task\_role\_policies) | Additional policy ARNs to attach to the task role. | `list(string)` | `[]` | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | Number of CPU units used by the task. | `number` | `1024` | no |
| <a name="input_task_cpu_architecture"></a> [task\_cpu\_architecture](#input\_task\_cpu\_architecture) | CPU architecture required by the task. | `string` | `"X86_64"` | no |
| <a name="input_task_definition_name"></a> [task\_definition\_name](#input\_task\_definition\_name) | Name of the task definition. Defaults to the base name. | `string` | `null` | no |
| <a name="input_task_ephemeral_storage_size_in_gib"></a> [task\_ephemeral\_storage\_size\_in\_gib](#input\_task\_ephemeral\_storage\_size\_in\_gib) | The amount of ephemeral storage (in GiB) to allocate to the task. | `number` | `20` | no |
| <a name="input_task_inference_accelerators"></a> [task\_inference\_accelerators](#input\_task\_inference\_accelerators) | List of Elastic Inference accelerators associated with the task. | <pre>list(object({<br>    name = string<br>    type = string<br>  }))</pre> | `[]` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | Amount (in MiB) of memory used by the task. | `number` | `2048` | no |
| <a name="input_task_operating_system_family"></a> [task\_operating\_system\_family](#input\_task\_operating\_system\_family) | OS family required by the task. | `string` | `"LINUX"` | no |
| <a name="input_task_proxy_configuration"></a> [task\_proxy\_configuration](#input\_task\_proxy\_configuration) | Configuration details for an App Mesh proxy. | <pre>object({<br>    container_name = string<br>    properties     = map(any)<br>    type           = optional(string, "APPMESH")<br>  })</pre> | `null` | no |
| <a name="input_task_volumes"></a> [task\_volumes](#input\_task\_volumes) | A list of volume definitions. | <pre>list(object({<br>    name      = string<br>    host_path = string<br><br>    docker_volume_configuration = optional(object({<br>      autoprovision = bool<br>      driver        = string<br>      driver_opts   = map(any)<br>      labels        = map(any)<br>      scope         = string<br>    }))<br><br>    efs_volume_configuration = optional(object({<br>      file_system_id          = string<br>      root_directory          = optional(string)<br>      transit_encryption      = optional(string)<br>      transit_encryption_port = optional(number)<br><br>      authorization_config = optional(object({<br>        access_point_id = string<br>        iam             = optional(string)<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Id of VPC. | `string` | n/a | yes |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | Private subnets from VPC. | `list(string)` | n/a | yes |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | Public subnets from VPC. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | Public address of ALB. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the ECS cluster. |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | Name of the ECR repository. |
| <a name="output_execution_role_arn"></a> [execution\_role\_arn](#output\_execution\_role\_arn) | ARN of the execution role. |
| <a name="output_execution_role_name"></a> [execution\_role\_name](#output\_execution\_role\_name) | Name of the execution role. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | Security group assigned to the service. |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the ECS service. |
| <a name="output_task_role_arn"></a> [task\_role\_arn](#output\_task\_role\_arn) | ARN of the task role. |
| <a name="output_task_role_name"></a> [task\_role\_name](#output\_task\_role\_name) | Name of the task role. |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

<<<<<<< HEAD
- resource.aws_cloudwatch_log_group.main (main.tf#208)
- resource.aws_ecs_service.main (main.tf#173)
=======
- resource.aws_cloudwatch_log_group.main (main.tf#204)
- resource.aws_ecs_service.main (main.tf#169)
>>>>>>> b91cd87652679cddb8d4d2d87d8df481531b15ca
- resource.aws_lb_listener.main (main.tf#68)
- resource.aws_lb_target_group.main (main.tf#41)
- resource.aws_security_group_rule.alb_egress_to_ecs (main.tf#15)
- resource.aws_security_group_rule.alb_ingress_to_ecs (main.tf#28)

# Examples
### Complete
```hcl
module "basic-example" {
  source = "../../"

  name = var.name

  vpc_id              = var.vpc_id
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets

  container_port  = var.container_port
  container_name  = var.container_name
  container_image = var.container_image
}
```
<!-- END_TF_DOCS -->
