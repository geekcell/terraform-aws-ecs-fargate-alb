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

variable "container_port" {
  description = "Port that the app container listens on."
  type        = number
}

variable "desired_count" {
  default     = 1
  description = "Number of desired Fargate tasks."
  type        = number
}
