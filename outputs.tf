output "alb_dns_name" {
  value       = module.alb.dns_name
  description = "Public address of ALB."
}

output "security_group_id" {
  value       = module.ecs_security_group.security_group_id
  description = "Security group assigned to the service."
}

output "ecr_repository_name" {
  value       = module.ecr_repository.name
  description = "Name of the ECR repository."
}

output "cluster_name" {
  value       = module.ecs_cluster.name
  description = "Name of the ECS cluster."
}

output "service_name" {
  value       = aws_ecs_service.web.name
  description = "Name of the ECS service."
}

output "task_role_name" {
  value       = module.ecs_task_definition.task_role_name
  description = "Name of the task role."
}

output "task_role_arn" {
  value       = module.ecs_task_definition.task_role_arn
  description = "ARN of the task role."
}

output "execution_role_name" {
  value       = module.ecs_task_definition.execution_role_name
  description = "Name of the execution role."
}

output "execution_role_arn" {
  value       = module.ecs_task_definition.execution_role_arn
  description = "ARN of the execution role."
}
