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

variable "app_port" {
  description = "Port that the app container listens on."
  type        = number
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
