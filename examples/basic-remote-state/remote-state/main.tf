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

  lifecycle {
    prevent_destroy = true
  }

  force_destroy = false
}

resource "aws_dynamodb_table" "this" {
  name = local.name

  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
