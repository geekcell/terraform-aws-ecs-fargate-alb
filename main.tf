module "alb" {
  source = "github.com/geekcell/terraform-aws-application-load-balancer?ref=v1.0.0"

  name    = var.name
  subnets = var.vpc_public_subnets

  enable_security_group                         = var.enable_security_group
  enable_security_group_default_http_https_rule = var.enable_security_group_default_http_https_rule
  enable_http_to_https_redirect                 = var.enable_http_to_https_redirect
}

resource "aws_security_group_rule" "alb_egress_to_ecs" {
  security_group_id = module.alb.security_group
  type              = "egress"

  description              = "Allow HTTP traffic to the ECS service ${var.name}."
  source_security_group_id = module.ecs_security_group.security_group_id
  protocol                 = var.container_protocol
  from_port                = var.container_port
  to_port                  = var.container_port
}

resource "aws_security_group_rule" "alb_ingress_to_ecs" {
  security_group_id = module.alb.security_group
  type              = "ingress"

  description              = "Allow HTTP traffic to the ECS service ${var.name}."
  source_security_group_id = module.ecs_security_group.security_group_id
  protocol                 = var.container_protocol
  from_port                = var.container_port
  to_port                  = var.container_port
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
}

module "ecs_cluster" {
  source = "github.com/geekcell/terraform-aws-ecs-cluster?ref=v1.0.0"
  name   = var.name
}

module "ecr_repository" {
  source = "github.com/geekcell/terraform-aws-ecr-repository?ref=v1.0.0"
  name   = var.name
}

# This task definition is used to deploy the service once.
# It is ignored after the first deployment, because the real
# task definition will be located in ECR.
module "ecs_container_definition" {
  source = "github.com/geekcell/terraform-aws-ecs-container-definition?ref=v1.0.0"

  name          = var.container_name
  image         = var.container_image
  port_mappings = [
    {
      container_port = var.container_port
      protocol       = var.container_protocol
    }
  ]
}

module "ecs_security_group" {
  source = "github.com/geekcell/terraform-aws-security-group?ref=v1.0.0"

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
}

module "ecs_task_definition" {
  source = "github.com/geekcell/terraform-aws-ecs-task-definition.git?ref=v1.0.0"

  name                             = var.name
  container_definitions            = [module.ecs_container_definition.hcl]
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
}

resource "aws_cloudwatch_log_group" "main" {
  name = "/aws/ecs/${module.ecs_cluster.name}/${var.name}"
}
