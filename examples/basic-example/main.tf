module "basic-example" {
  source = "../../"

  name = var.name

  vpc_id              = var.vpc_id
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets

  app_port = var.app_port
}
