# Terraform AWS Lambda module: scheduler/cron

[![GitHub Actions](https://github.com/uridium/terraform-aws-lambda-scheduler/workflows/generate-changelog/badge.svg)](https://github.com/uridium/terraform-aws-lambda-scheduler/actions)
[![Latest tag](https://img.shields.io/github/v/tag/uridium/terraform-aws-lambda-scheduler)](https://registry.terraform.io/modules/uridium/lambda-scheduler/aws)

Terraform AWS module which creates Lambda resource with attached CloudWatch scheduler.

It integrates Lambda function with CloudWatch cron expression using EventBridge.

## Usage

```hcl
module "cron" {
  source = "git@github.com:uridium/terraform-aws-lambda-scheduler.git"

  region        = "eu-west-1"
  function_name = "plower"
  handler       = "lambda.handler"
  runtime       = "python3.8"

  layer_enabled = true

  code_directory = "/opt/lambda"

  input = "{\"firstName\": \"John\", \"lastName\": \"Doe\"}"

  vars = {
    foo = "bar"
  }

  tags = {
    Env = "Stage"
  }

  cron = "cron(01 06 ? * MON-FRI *)"
}
```

### Development

This module uses [pre-commit](https://pre-commit.com/) hook to identify simple issues before pushing code to the remote repository, and relies on *.pre-commit-config.yaml* file.

To use it simply run:

```bash
pip install pre-commit
pre-commit install
```

Now `pre-commit` will run automatically on every `git commit`.

## Notes

* `code_directory` specifies a directory where you keep your entire Lambda code
* If you want to create a layer, simply put it into *layer/\<runtime\>* directory and set `layer_enabled` to `true`

## Examples

* [Basic](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/basic)
* [Basic with remote state file and locking](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/basic-remote-state)
* [Complete with python](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/complete-python)
* [Complete with nodejs](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/complete-nodejs)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.2 |
| archive | ~> 1.3.0 |
| aws | ~> 3.5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| code\_directory | A relative or full path to the directory with your Lambda Function (and Layer if you use it) code. For example: /opt/lambda | `string` | n/a | yes |
| cron | The scheduling expression. For example: cron(0 20 \* \* ? \*) or rate(5 minutes) | `string` | n/a | yes |
| description | Description of what your Lambda Function does | `string` | `"Generated by Terraform"` | no |
| function\_name | A unique name for your Lambda Function | `string` | n/a | yes |
| handler | The function entrypoint in your code | `string` | n/a | yes |
| input | Valid JSON text passed to the target | `string` | `null` | no |
| layer\_enabled | Create a Lambda Layer Version resource | `bool` | `false` | no |
| memory\_size | The amount of memory in MB your Lambda Function can use at runtime | `number` | `128` | no |
| region | This is the AWS region | `string` | n/a | yes |
| runtime | The identifier of the function's runtime | `string` | n/a | yes |
| security\_group\_ids | A list of security group IDs associated with the Lambda function | `list(string)` | `[]` | no |
| subnet\_ids | A list of subnet IDs associated with the Lambda function | `list(string)` | `[]` | no |
| tags | A map of tags to assign to the object | `map(string)` | `null` | no |
| timeout | The amount of time your Lambda Function has to run in seconds | `number` | `3` | no |
| tracing\_mode | Define X-Ray tracing mode to record timing and error information for a subset of invocations | `string` | `"PassThrough"` | no |
| vars | The Lambda environment's configuration settings | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| lambda\_function\_arn | The ARN of the Lambda Function |
| lambda\_function\_filename | The filename of the function zip archive |
| lambda\_function\_handler | The filename.handler-method value in your function |
| lambda\_function\_last\_modified | The time when the Lambda Function was modified |
| lambda\_function\_name | The name of the Lambda Function |
| lambda\_function\_role | IAM role attached to the Lambda Function |
| lambda\_function\_runtime | The identifier of the Lambda Function's runtime |
| lambda\_function\_source\_code\_hash | A base64-encoded SHA256 hash of the package file |
| lambda\_function\_source\_code\_size | The size in bytes of the function .zip file |
| lambda\_function\_version | Latest published version of your Lambda Function |
| lambda\_function\_vpc\_config | A list of subnets and security groups associated tiwht the Lambda Function |
| lambda\_layer\_filename | The filename of the layer zip archive |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
