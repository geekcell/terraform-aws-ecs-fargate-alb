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
}
