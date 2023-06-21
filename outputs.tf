output "alb_dns_name" {
  value       = module.alb.dns_name
  description = "Public address of ALB."
}

output "security_group_id" {
  value       = module.ecs_security_group.security_group_id
  description = "Security group assigned to the service"
}
