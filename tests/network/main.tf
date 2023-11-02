module "vpc" {
  source  = "registry.terraform.io/terraform-aws-modules/vpc/aws"
  version = "~> 5.0.0"

  name            = "${var.name}-main"
  cidr            = "10.200.0.0/16"
  azs             = ["eu-central-1a", "eu-central-1b"]
  private_subnets = ["10.200.1.0/24", "10.200.2.0/24"]
  public_subnets  = ["10.200.3.0/24", "10.200.4.0/24"]
}
