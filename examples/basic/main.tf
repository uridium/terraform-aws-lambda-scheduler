module "cron" {
  source = "../.."

  region        = "eu-west-1"
  function_name = "basic"
  handler       = "lambda.handler"
  runtime       = "python3.8"

  code_directory = "./lambda"

  cron = "cron(01 06 ? * MON-FRI *)"
}
