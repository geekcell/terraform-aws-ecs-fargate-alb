variables {
  name = "test-fargate-alb"
}

run "setup" {
  module {
    source = "./tests/network"
  }
}

run "basic_fargate_alb" {
  variables {
    name = var.name

    vpc_id              = run.setup.vpc_id
    vpc_private_subnets = run.setup.vpc_private_subnets
    vpc_public_subnets  = run.setup.vpc_public_subnets

    # allow teardown to remove ALB
    enable_deletion_protection = false
  }

  assert {
    condition     = length(module.alb.dns_name) >= 0
    error_message = "Expected ALB DNS to be created."
  }

  assert {
    condition     = length(module.ecs_security_group.security_group_id) >= 0
    error_message = "Expected ALB security group to be created."
  }

  assert {
    condition     = length(aws_lb_target_group.main.arn) >= 0
    error_message = "Expected ALB target group to be created."
  }

  assert {
    condition     = aws_lb_target_group.main.port == 80
    error_message = "Expected ALB target group port to be 80."
  }

  assert {
    condition     = length(aws_lb_listener.main.arn) >= 0
    error_message = "Expected ALB listener to be created."
  }

  assert {
    condition     = length(module.ecs_cluster.arn) >= 0
    error_message = "Expected ECS cluster to be created."
  }

  assert {
    condition     = length(aws_ecs_service.main.name) >= 0
    error_message = "Expected ECS service to be created."
  }

  assert {
    condition     = length(aws_cloudwatch_log_group.main.arn) >= 0
    error_message = "Expected log group to be created."
  }

  assert {
    condition     = length(module.ecr_repository.arn) >= 0
    error_message = "Expected ECR repository to be created."
  }

  assert {
    condition     = length(module.ecs_container_definition.json) >= 0
    error_message = "Expected ECS container definition to be created."
  }

  assert {
    condition     = length(module.ecs_task_definition.arn) >= 0
    error_message = "Expected ECS task definition to be created."
  }
}
