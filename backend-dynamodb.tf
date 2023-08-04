## DynamoDB Table for state locking.

resource "aws_dynamodb_table" "state" {
  name         = var.dynamodb_table_name
  tags         = merge(var.common_tags, var.dynamodb_table_tags)
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}


data "aws_iam_policy_document" "dynamodb" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
    ]
    resources = [aws_dynamodb_table.state.arn]
  }
}
