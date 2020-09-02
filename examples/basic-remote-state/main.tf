terraform {
  backend "s3" {
    bucket = "terraform-remote-state-lambda-scheduler"
    key = "terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
    dynamodb_table = "terraform-remote-state-lambda-scheduler"
  }
}

module "cron" {
  source = "../.."

  region        = "eu-west-1"
  function_name = "basic"
  handler       = "lambda.handler"
  runtime       = "python3.8"

  code_directory = "./lambda"

  cron = "cron(01 07 ? * MON-FRI *)"
}
