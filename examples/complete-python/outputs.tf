output "function_arn" {
  description = "ARN of the lambda function"
  value       = module.cron.lambda_function_arn
}

output "function_name" {
  description = "Name of the lambda function"
  value       = module.cron.lambda_function_name
}

output "function_runtime" {
  description = "Runtime of the lambda function"
  value       = module.cron.lambda_function_runtime
}
