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

- resource.aws_cloudwatch_log_group.main (main.tf#171)
- resource.aws_ecs_service.main (main.tf#138)
- resource.aws_lb_listener.main (main.tf#60)
- resource.aws_lb_target_group.main (main.tf#35)
- resource.aws_security_group_rule.alb_egress_to_ecs (main.tf#13)
- resource.aws_security_group_rule.alb_ingress_to_ecs (main.tf#24)

# Examples
### Complete
```hcl
module "basic-example" {
  source = "../../"

  name = var.name

  vpc_id              = var.vpc_id
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets

  app_port = var.app_port
}
```
<!-- END_TF_DOCS -->
