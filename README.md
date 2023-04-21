# Terraform AWS Lambda module: scheduler/cron

[![GitHub Actions](https://github.com/uridium/terraform-aws-lambda-scheduler/workflows/Lint/badge.svg)](https://github.com/uridium/terraform-aws-lambda-scheduler/actions/workflows/lint.yml)
[![GitHub Actions](https://github.com/uridium/terraform-aws-lambda-scheduler/workflows/Release/badge.svg)](https://github.com/uridium/terraform-aws-lambda-scheduler/actions/workflows/release.yml)
[![Latest tag](https://img.shields.io/github/v/tag/uridium/terraform-aws-lambda-scheduler)](https://registry.terraform.io/modules/uridium/lambda-scheduler/aws)

Terraform AWS module which creates Lambda resource with attached CloudWatch scheduler.

It integrates Lambda function with CloudWatch cron expression using EventBridge.

Simply put, thanks to this module, you can schedule your code to run at a specific time.

## Usage

```hcl
module "cron" {
  source = "git@github.com:uridium/terraform-aws-lambda-scheduler.git"

  function_name  = "plower"
  handler        = "lambda.handler"
  runtime        = "python3.9"
  layer_enabled  = true
  code_directory = "/opt/lambda"
  input          = "{\"firstName\": \"John\", \"lastName\": \"Doe\"}"

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

* [Displays Hello World with Python, no VPC](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/no_vpc_no_layer_python)
* [Displays Hello World with Python, no VPC, uses remote state file and locking](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/no_vpc_no_layer_python_remote_state)
* [Displays HTTP headers with Nodejs, VPC](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/vpc_layer_nodejs)
* [Displays HTTP headers with Python, VPC](https://github.com/uridium/terraform-aws-lambda-scheduler/tree/master/examples/vpc_layer_python)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_archive"></a> [archive](#requirement\_archive) | >= 2.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.xray](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_layer_version.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [aws_lambda_permission.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [archive_file.function_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [archive_file.layer_zip](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_code_directory"></a> [code\_directory](#input\_code\_directory) | A relative or full path to the directory with your Lambda Function (and Layer if you use it) code. For example: /opt/lambda | `string` | n/a | yes |
| <a name="input_cron"></a> [cron](#input\_cron) | The scheduling expression. For example: cron(0 20 * * ? *) or rate(5 minutes) | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of what your Lambda Function does | `string` | `"Generated by Terraform"` | no |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | A unique name for your Lambda Function | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | The function entrypoint in your code | `string` | n/a | yes |
| <a name="input_input"></a> [input](#input\_input) | Valid JSON text passed to the target | `string` | `null` | no |
| <a name="input_layer_enabled"></a> [layer\_enabled](#input\_layer\_enabled) | Create a Lambda Layer Version resource | `bool` | `false` | no |
| <a name="input_memory_size"></a> [memory\_size](#input\_memory\_size) | The amount of memory in MB your Lambda Function can use at runtime | `number` | `128` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | The identifier of the function's runtime | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of security group IDs associated with the Lambda function | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs associated with the Lambda function | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the object | `map(string)` | `null` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | The amount of time your Lambda Function has to run in seconds | `number` | `3` | no |
| <a name="input_tracing_mode"></a> [tracing\_mode](#input\_tracing\_mode) | Define X-Ray tracing mode to record timing and error information for a subset of invocations | `string` | `"PassThrough"` | no |
| <a name="input_vars"></a> [vars](#input\_vars) | The Lambda environment's configuration settings | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | The ARN of the Lambda Function |
| <a name="output_lambda_function_filename"></a> [lambda\_function\_filename](#output\_lambda\_function\_filename) | The filename of the function zip archive |
| <a name="output_lambda_function_handler"></a> [lambda\_function\_handler](#output\_lambda\_function\_handler) | The filename.handler-method value in your function |
| <a name="output_lambda_function_last_modified"></a> [lambda\_function\_last\_modified](#output\_lambda\_function\_last\_modified) | The time when the Lambda Function was modified |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | The name of the Lambda Function |
| <a name="output_lambda_function_role"></a> [lambda\_function\_role](#output\_lambda\_function\_role) | IAM role attached to the Lambda Function |
| <a name="output_lambda_function_runtime"></a> [lambda\_function\_runtime](#output\_lambda\_function\_runtime) | The identifier of the Lambda Function's runtime |
| <a name="output_lambda_function_source_code_hash"></a> [lambda\_function\_source\_code\_hash](#output\_lambda\_function\_source\_code\_hash) | A base64-encoded SHA256 hash of the package file |
| <a name="output_lambda_function_source_code_size"></a> [lambda\_function\_source\_code\_size](#output\_lambda\_function\_source\_code\_size) | The size in bytes of the function .zip file |
| <a name="output_lambda_function_version"></a> [lambda\_function\_version](#output\_lambda\_function\_version) | Latest published version of your Lambda Function |
| <a name="output_lambda_function_vpc_config"></a> [lambda\_function\_vpc\_config](#output\_lambda\_function\_vpc\_config) | A list of subnets and security groups associated tiwht the Lambda Function |
| <a name="output_lambda_layer_filename"></a> [lambda\_layer\_filename](#output\_lambda\_layer\_filename) | The filename of the layer zip archive |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
