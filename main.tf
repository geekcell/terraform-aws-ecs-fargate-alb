module "alb" {
  source  = "geekcell/application-load-balancer/aws"
  version = "v1.1.0"

  name    = var.name
  subnets = var.vpc_public_subnets

  enable_security_group                         = var.enable_security_group
  enable_security_group_default_http_https_rule = var.enable_security_group_default_http_https_rule
  enable_http_to_https_redirect                 = var.enable_http_to_https_redirect
  enable_deletion_protection                    = var.enable_deletion_protection

  tags = var.tags
}

resource "aws_lb_target_group" "main" {
  name   = var.name
  vpc_id = var.vpc_id

  port                 = var.container_port
  protocol             = "HTTP"
  target_type          = "ip"
  deregistration_delay = 5

  health_check {
    protocol = "HTTP"
    port     = var.container_port
    path     = "/ok"

    interval            = 5
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = module.alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }

  depends_on = [aws_lb_target_group.main]

  tags = var.tags
}

module "ecs_cluster" {
  source  = "geekcell/ecs-cluster/aws"
  version = "v1.0.1"

  name = var.name
  tags = var.tags
}

module "ecr_repository" {
  source  = "geekcell/ecr-repository/aws"
  version = "v1.0.1"

  name = var.name
  tags = var.tags
}

module "ecs_container_definition" {
  source  = "geekcell/ecs-container-definition/aws"
  version = "v2.0.0"

  name  = var.container_name
  image = var.container_image

  port_mappings = [
    {
      container_port = var.container_port
      protocol       = var.container_protocol
    }
  ]
}

module "ecs_security_group" {
  source  = "geekcell/security-group/aws"
  version = "v1.0.2"

  name   = "${var.name}-ecs"
  vpc_id = var.vpc_id

  ingress_rules = [
    {
      description              = "Allow HTTP traffic from the ALB."
      port                     = var.container_port
      protocol                 = var.container_protocol
      source_security_group_id = module.alb.security_group
    }
  ]
  egress_rules = [
    {
      description = "Allow all outbound traffic."
      port        = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = var.tags
}

module "ecs_task_definition" {
  source  = "geekcell/ecs-task-definition/aws"
  version = "v1.0.1"

  name = coalesce(var.task_definition_name, var.name)

  container_definitions = [module.ecs_container_definition.hcl]

  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  # Pass through
  enable_execute_command           = var.enable_execute_command
  cpu                              = var.task_cpu
  memory                           = var.task_memory
  operating_system_family          = var.task_operating_system_family
  cpu_architecture                 = var.task_cpu_architecture
  ephemeral_storage_size_in_gib    = var.task_ephemeral_storage_size_in_gib
  volumes                          = var.task_volumes
  inference_accelerators           = var.task_inference_accelerators
  proxy_configuration              = var.task_proxy_configuration
  additional_execute_role_policies = var.task_additional_execute_role_policies
  additional_task_role_policies    = var.task_additional_task_role_policies

  tags = var.tags
}

resource "aws_ecs_service" "main" {
  name = var.name

  launch_type            = "FARGATE"
  cluster                = module.ecs_cluster.name
  task_definition        = module.ecs_task_definition.arn
  desired_count          = var.desired_count
  enable_execute_command = var.enable_execute_command

  deployment_controller {
    type = "ECS"
  }

  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent

  network_configuration {
    subnets          = var.vpc_private_subnets
    security_groups  = [module.ecs_security_group.security_group_id]
    assign_public_ip = false
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "main" {
  name = "/aws/ecs/${module.ecs_cluster.name}/${var.name}"
  tags = var.tags
}
