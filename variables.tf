variable "name" {
  description = "Name to use for components."
  type        = string
}

variable "vpc_id" {
  description = "Id of VPC."
  type        = string
}

variable "vpc_public_subnets" {
  description = "Public subnets from VPC."
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "Private subnets from VPC."
  type        = list(string)
}

variable "desired_count" {
  default     = 1
  description = "Number of desired Fargate tasks."
  type        = number
}

variable "enable_execute_command" {
  default     = true
  description = "Allow execution commands on containers."
  type        = bool
}

variable "enable_security_group" {
  default     = true
  description = "Enable default security group."
  type        = bool
}

variable "enable_security_group_default_http_https_rule" {
  default     = true
  description = "Enable default security group rules for port 80 & 443."
  type        = bool
}

variable "enable_http_to_https_redirect" {
  default     = false
  description = "Enable port 80 redirect to 443."
  type        = bool
}

variable "container_name" {
  default     = "nginx"
  description = "Name of container to create task definition with."
  type        = string
}

variable "container_image" {
  default     = "public.ecr.aws/docker/library/nginx:1.23-alpine"
  description = "Image to create task definition with."
  type        = string
}

variable "container_port" {
  default     = 80
  description = "Port to create task definition with."
  type        = number
}

variable "container_protocol" {
  default     = "tcp"
  description = "Protocol to create task definition with."
  type        = string
}

variable "deployment_maximum_percent" {
  default     = 200
  description = "Maximum deployment percent. Usually double minimum to allow rolling deployment."
  type        = number
}

variable "deployment_minimum_healthy_percent" {
  default     = 100
  description = "Minimum deployment percent. Usually set to 100 to ensure at least one task."
  type        = number
}
