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

variable "tags" {
  description = "Tags to add to the created resources."
  default     = {}
  type        = map(any)
}

## TASK DEFINITION
variable "task_definition_name" {
  description = "Name of the task definition. Defaults to the base name."
  default     = null
  type        = string
}

variable "task_memory" {
  description = "Amount (in MiB) of memory used by the task."
  default     = 2048
  type        = number
}

variable "task_cpu" {
  description = "Number of CPU units used by the task."
  default     = 1024
  type        = number
}

variable "task_operating_system_family" {
  description = "OS family required by the task."
  default     = "LINUX"
  type        = string

  validation {
    condition = contains([
      "LINUX", "WINDOWS_SERVER_2019_FULL", "WINDOWS_SERVER_2019_CORE", "WINDOWS_SERVER_2022_FULL",
      "WINDOWS_SERVER_2022_CORE"
    ], var.task_operating_system_family)
    error_message = "Value must be `X86_64` or `ARM64`."
  }
}

variable "task_cpu_architecture" {
  description = "CPU architecture required by the task."
  default     = "X86_64"
  type        = string

  validation {
    condition     = contains(["X86_64", "ARM64"], var.task_cpu_architecture)
    error_message = "Value must be `X86_64` or `ARM64`."
  }
}

variable "task_ephemeral_storage_size_in_gib" {
  description = "The amount of ephemeral storage (in GiB) to allocate to the task."
  default     = 20
  type        = number

  validation {
    condition     = var.task_ephemeral_storage_size_in_gib >= 20 && var.task_ephemeral_storage_size_in_gib <= 200
    error_message = "Value must be between 20 and 200."
  }
}

variable "task_volumes" {
  description = "A list of volume definitions."
  default     = []
  type = list(object({
    name      = string
    host_path = string

    docker_volume_configuration = optional(object({
      autoprovision = bool
      driver        = string
      driver_opts   = map(any)
      labels        = map(any)
      scope         = string
    }))

    efs_volume_configuration = optional(object({
      file_system_id          = string
      root_directory          = optional(string)
      transit_encryption      = optional(string)
      transit_encryption_port = optional(number)

      authorization_config = optional(object({
        access_point_id = string
        iam             = optional(string)
      }))
    }))
  }))
}

variable "task_inference_accelerators" {
  description = "List of Elastic Inference accelerators associated with the task."
  default     = []
  type = list(object({
    name = string
    type = string
  }))
}

variable "task_proxy_configuration" {
  description = "Configuration details for an App Mesh proxy."
  default     = null
  type = object({
    container_name = string
    properties     = map(any)
    type           = optional(string, "APPMESH")
  })
}

variable "task_additional_execute_role_policies" {
  description = "Additional policy ARNs to attach to the execution role."
  default     = []
  type        = list(string)
}

variable "task_additional_task_role_policies" {
  description = "Additional policy ARNs to attach to the task role."
  default     = []
  type        = list(string)
}
