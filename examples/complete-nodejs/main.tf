data "aws_region" "this" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "complete-nodejs"
  cidr = "10.0.0.0/16"

  azs             = formatlist("${data.aws_region.this.name}%s", ["a", "b", "c"])
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  tags = {
    Env       = "Stage"
    Terraform = "True"
  }
}

module "cron" {
  source = "../.."

  function_name  = "complete-nodejs"
  handler        = "lambda.handler"
  runtime        = "nodejs18.x"
  memory_size    = 256
  timeout        = 10
  tracing_mode   = "Active"
  code_directory = "./lambda"
  layer_enabled  = true

  vars = {
    foo = "bar"
  }

  tags = {
    Env       = "Stage"
    Terraform = "True"
  }

  subnet_ids         = module.vpc.private_subnets
  security_group_ids = [module.vpc.default_security_group_id]

  cron = "cron(01 06 ? * MON-FRI *)"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# NOTE on Egress rules
resource "aws_security_group_rule" "this" {
  security_group_id = module.vpc.default_security_group_id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  depends_on = [module.cron]
}
