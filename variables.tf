variable "common_tags" {
  description = "A map of tags to assign to every resource in this module."
  type        = map(string)
  default     = {}
}

variable "bucket_name" {
  description = "The name of the S3 Bucket to use for state storage."
  type        = string
}

variable "bucket_server_side_encryption" {
  description = "If true, enables S3 bucket server-side encryption."
  type        = bool
  default     = true
}

variable "bucket_tags" {
  description = "A map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "dynamodb_table_name" {
  description = "The name of DynamoDB Table to use for state locking and consistency."
  type        = string
  default     = "terraform-state-locks"
}

variable "dynamodb_table_tags" {
  description = "A map of tags to assign to the table."
  type        = map(string)
  default     = {}
}

variable "iam_policy_name" {
  description = "The name of the IAM policy to provide Terraform state access."
  type        = string
  default     = null
}

variable "iam_policy_path" {
  description = "Path in which to create the policy."
  type        = string
  default     = "/"
}

variable "iam_policy_tags" {
  description = "A map of tags to assign to the IAM policy."
  type        = map(string)
  default     = {}
}
