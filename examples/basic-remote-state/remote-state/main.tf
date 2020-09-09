provider "aws" {
  region = "eu-west-1"
}

locals {
  name = "terraform-remote-state-lambda-scheduler"
}

resource "aws_s3_bucket" "this" {
  bucket = local.name

  versioning {
    enabled = true
  }

  force_destroy = false

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "this" {
  name = local.name

  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }
}
