module "cron" {
  source = "../.."

  region        = "eu-west-1"
  function_name = "complete"
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

  subnet_ids         = ["subnet-xxxxxxxx", "subnet-xxxxxxxx"]
  security_group_ids = ["sg-xxxxxxxx"]

  cron = "cron(01 06 ? * MON-FRI *)"
}
