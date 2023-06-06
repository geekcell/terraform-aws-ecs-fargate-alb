output "alb_dns_name" {
  value       = module.alb.dns_name
  description = "Public address of ALB."
}
