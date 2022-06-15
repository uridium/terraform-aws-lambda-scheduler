module "cron" {
  source = "../.."

  function_name = "basic"
  handler       = "lambda.handler"
  runtime       = "python3.9"

  code_directory = "./lambda"

  cron = "cron(01 06 ? * MON-FRI *)"
}
