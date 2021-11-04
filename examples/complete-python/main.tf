module "cron" {
  source = "../.."

  region        = "us-east-1"
  function_name = "complete-python"
  handler       = "lambda.handler"
  runtime       = "python3.8"
  memory_size   = 256
  timeout       = 10

  tracing_mode = "Active"

  layer_enabled = true

  code_directory = "./lambda"

  vars = {
    foo = "bar"
  }

  tags = {
    Env       = "Stage"
    Provision = "False"
  }

  cron = "cron(01 06 ? * MON-FRI *)"
}
