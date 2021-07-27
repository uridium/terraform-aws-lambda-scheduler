terraform {
  backend "s3" {
    bucket = "terraform-remote-state-lambda-scheduler"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-remote-state-lambda-scheduler"
  }
}

module "cron" {
  source = "../.."

  region        = "us-east-1"
  function_name = "basic"
  handler       = "lambda.handler"
  runtime       = "python3.8"

  code_directory = "./lambda"

  cron = "cron(01 07 ? * MON-FRI *)"
}
