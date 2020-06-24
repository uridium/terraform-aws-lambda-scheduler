provider "aws" {
  region = var.region
}

locals {
  name = var.function_name
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = format("%s-role", local.name)
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_cloudwatch_event_rule" "this" {
  name                = format("%s-scheduler", local.name)
  description         = var.description
  schedule_expression = var.cron
  tags                = var.tags
}

resource "aws_cloudwatch_event_target" "this" {
  rule = aws_cloudwatch_event_rule.this.name
  arn  = aws_lambda_function.this.arn
  # input = TODO
}

resource "aws_lambda_permission" "this" {
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  action        = "lambda:InvokeFunction"
  source_arn    = aws_cloudwatch_event_rule.this.arn
}

resource "aws_lambda_layer_version" "this" {
  count = var.layer_enabled ? 1 : 0

  layer_name          = format("%s-layer", local.name)
  filename            = format("%s/%s-layer.zip", var.code_directory, local.name)
  source_code_hash    = filebase64sha256(format("%s/%s-layer.zip", var.code_directory, local.name))
  description         = var.description
  compatible_runtimes = [var.runtime]
}

resource "aws_lambda_function" "this" {
  ## Configuration
  # Designer
  function_name = format("%s-function", local.name)
  layers        = [aws_lambda_layer_version.this[0].arn]

  # Function code
  filename         = format("%s/%s-function.zip", var.code_directory, local.name)
  source_code_hash = filebase64sha256(format("%s/%s-function.zip", var.code_directory, local.name))

  # Environment variables
  dynamic "environment" {
    for_each = var.vars[*]
    content { variables = environment.value }
  }

  # Tags
  tags = var.tags

  # Basic settings
  description = var.description
  handler     = var.handler
  runtime     = var.runtime
  memory_size = var.memory_size
  timeout     = var.timeout

  # VPC
  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  ## Permissions
  # Execution role
  role       = aws_iam_role.this.arn
  depends_on = [aws_iam_role_policy_attachment.this]
}
