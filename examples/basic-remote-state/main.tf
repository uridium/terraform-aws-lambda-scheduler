terraform {
  backend "s3" {
    bucket = "terraform-remote-state-lambda-scheduler"
    key = "terraform.tfstate"
    encrypt = true
    dynamodb_table = "terraform-remote-state-lambda-scheduler"
  }
}

module "cron" {
  source = "../.."

  function_name = "basic"
  handler       = "lambda.handler"
  runtime       = "python3.9"

  code_directory = "./lambda"

  cron = "cron(01 07 ? * MON-FRI *)"
}
