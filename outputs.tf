output "lambda_function_name" {
  description = "The name of the Lambda Function"
  value       = aws_lambda_function.this.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda Function"
  value       = aws_lambda_function.this.arn
}

output "lambda_function_role" {
  description = "IAM role attached to the Lambda Function"
  value       = aws_lambda_function.this.role
}

output "lambda_function_filename" {
  description = "The filename of the function zip archive"
  value       = aws_lambda_function.this.filename
}

output "lambda_layer_filename" {
  description = "The filename of the layer zip archive"
  value       = aws_lambda_layer_version.this.*.filename
}

output "lambda_function_handler" {
  description = "The filename.handler-method value in your function"
  value       = aws_lambda_function.this.handler
}

output "lambda_function_runtime" {
  description = "The identifier of the Lambda Function's runtime"
  value       = aws_lambda_function.this.runtime
}

output "lambda_function_last_modified" {
  description = "The time when the Lambda Function was modified"
  value       = aws_lambda_function.this.last_modified
}

output "lambda_function_version" {
  description = "Latest published version of your Lambda Function"
  value       = aws_lambda_function.this.version
}

output "lambda_function_source_code_size" {
  description = "The size in bytes of the function .zip file"
  value       = aws_lambda_function.this.source_code_size
}

output "lambda_function_source_code_hash" {
  description = "A base64-encoded SHA256 hash of the package file"
  value       = aws_lambda_function.this.source_code_hash
}

output "lambda_function_vpc_config" {
  description = "A list of subnets and security groups associated tiwht the Lambda Function"
  value       = aws_lambda_function.this.vpc_config
}

output "lambda_function_image_uri" {
  description = "A list of subnets and security groups associated tiwht the Lambda Function"
  value       = aws_lambda_function.this.image_uri
}
