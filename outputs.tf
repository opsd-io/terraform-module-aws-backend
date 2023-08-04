output "bucket_name" {
  description = "The name of the S3 Bucket to use for state storage."
  sensitive   = false
  value       = aws_s3_bucket.state.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 Bucket."
  sensitive   = false
  value       = aws_s3_bucket.state.arn
}


output "dynamodb_table_name" {
  description = "The name of DynamoDB Table to use for state locking and consistency."
  sensitive   = false
  value       = aws_dynamodb_table.state.name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB Table."
  sensitive   = false
  value       = aws_dynamodb_table.state.arn
}


output "state_access_policy_name" {
  description = "The name of the state access policy."
  value       = aws_iam_policy.state_access.name
  sensitive   = false
}

output "state_access_policy_arn" {
  description = "The ARN of the state access policy."
  value       = aws_iam_policy.state_access.arn
  sensitive   = false
}
