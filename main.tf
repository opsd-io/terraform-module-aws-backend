terraform {
  required_version = ">= 1.3.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.0"
    }
  }
}

resource "aws_iam_policy" "state_access" {
  name        = coalesce(var.iam_policy_name, "${aws_s3_bucket.state.bucket}-access")
  path        = var.iam_policy_path
  tags        = merge(var.common_tags, var.iam_policy_tags)
  description = "Provides access to Terraform state."
  policy      = data.aws_iam_policy_document.state_access.json
}

data "aws_iam_policy_document" "state_access" {
  source_policy_documents = [
    data.aws_iam_policy_document.s3bucket.json,
    data.aws_iam_policy_document.dynamodb.json,
  ]
}
