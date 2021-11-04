provider "aws" {
  region = "us-east-1"
}

locals {
  name = "terraform-remote-state-lambda-scheduler"
}

resource "aws_s3_bucket" "this" {
  bucket = local.name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

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
