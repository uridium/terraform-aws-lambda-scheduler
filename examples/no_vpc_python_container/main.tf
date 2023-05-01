data "aws_ecr_authorization_token" "this" {}

provider "docker" {
  registry_auth {
    address  = data.aws_ecr_authorization_token.this.proxy_endpoint
    username = data.aws_ecr_authorization_token.this.user_name
    password = data.aws_ecr_authorization_token.this.password
  }
}

locals {
  name      = "headers"
  image_tag = "v1.0"
}

resource "aws_ecr_repository" "this" {
  name                 = local.name
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true
}

resource "docker_image" "this" {
  name         = trimprefix("${data.aws_ecr_authorization_token.this.proxy_endpoint}/${aws_ecr_repository.this.name}:${local.image_tag}", "https://")
  keep_locally = false
  build {
    context = path.cwd
  }
  triggers = {
    dir_sha1 = sha1(join("", [for i in fileset(path.module, "{Dockerfile, lambda.py}") : filesha1(i)]))
  }
}

resource "docker_registry_image" "this" {
  name          = docker_image.this.name
  keep_remotely = false
}

module "cron" {
  source = "../.."

  function_name = local.name
  package_type  = "Image"
  image_uri     = docker_registry_image.this.name

  cron = "cron(01 06 ? * MON-FRI *)"
}
