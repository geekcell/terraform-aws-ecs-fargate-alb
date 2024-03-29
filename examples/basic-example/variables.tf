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

variable "desired_count" {
  default     = 1
  description = "Number of desired Fargate tasks."
  type        = number
}
