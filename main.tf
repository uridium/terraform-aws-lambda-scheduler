provider "aws" {
  region = var.region
}

locals {
  name                = var.function_name
  policy_lambda_vpc   = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  policy_lambda_basic = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
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

data "archive_file" "function_zip" {
  type        = "zip"
  source_dir  = format("%s/function", var.code_directory)
  output_path = format("%s/function.zip", var.code_directory)
}

data "archive_file" "layer_zip" {
  count = var.layer_enabled ? 1 : 0

  type        = "zip"
  source_dir  = format("%s/layer", var.code_directory)
  output_path = format("%s/layer.zip", var.code_directory)
}

resource "aws_iam_role" "this" {
  name               = local.name
  description        = var.description
  assume_role_policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = length(var.subnet_ids) > 0 ? local.policy_lambda_vpc : local.policy_lambda_basic
}

resource "aws_cloudwatch_event_rule" "this" {
  name                = local.name
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

  layer_name          = local.name
  filename            = data.archive_file.layer_zip[0].output_path
  source_code_hash    = data.archive_file.layer_zip[0].output_base64sha256
  description         = var.description
  compatible_runtimes = [var.runtime]
}

resource "aws_lambda_function" "this" {
  ## Configuration
  # Designer
  function_name = local.name
  layers        = var.layer_enabled ? [aws_lambda_layer_version.this[0].arn] : null

  # Function code
  filename         = data.archive_file.function_zip.output_path
  source_code_hash = data.archive_file.function_zip.output_base64sha256

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
