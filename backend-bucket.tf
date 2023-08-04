## S3 Bucket for state storage.

resource "aws_s3_bucket" "state" {
  bucket = var.bucket_name
  tags   = merge(var.common_tags, var.bucket_tags)
}

resource "aws_s3_bucket_acl" "state" {
  bucket = aws_s3_bucket.state.id
  acl    = "private"
  depends_on = [
    aws_s3_bucket_ownership_controls.state,
  ]
}

resource "aws_s3_bucket_ownership_controls" "state" {
  bucket = aws_s3_bucket.state.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "state" {
  bucket                  = aws_s3_bucket.state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}

## S3 Bucket encryption.

resource "aws_kms_key" "state" {
  count                   = var.bucket_server_side_encryption ? 1 : 0
  description             = "Terraform state encryption key - ${var.bucket_name} bucket."
  deletion_window_in_days = 14
}

resource "aws_kms_alias" "state" {
  count         = var.bucket_server_side_encryption ? 1 : 0
  name          = "alias/${var.bucket_name}"
  target_key_id = aws_kms_key.state[0].key_id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state" {
  count  = var.bucket_server_side_encryption ? 1 : 0
  bucket = aws_s3_bucket.state.bucket
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.state[0].arn
      sse_algorithm     = "aws:kms"
    }
  }
}

## Access policy.

data "aws_iam_policy_document" "s3bucket" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
    ]
    resources = [aws_s3_bucket.state.arn]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    resources = ["${aws_s3_bucket.state.arn}/*.tfstate"]
  }
  dynamic "statement" {
    # Only if bucket_server_side_encryption=true we need access to KMS.
    for_each = var.bucket_server_side_encryption ? [0] : []
    content {
      effect = "Allow"
      actions = [
        "kms:Encrypt",
        "kms:Decrypt",
        "kms:GenerateDataKey",
      ]
      resources = [aws_kms_key.state[0].arn]
    }
  }
}
