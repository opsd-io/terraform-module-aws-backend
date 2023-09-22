<a href="https://www.opsd.io" target="_blank"><img alt="OPSd" src=".github/img/OPSD_logo.svg" width="180px"></a>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-template

## Introduction

What does the module provide?

## Usage

```hcl
module "tfstate_backend" {
  source      = "github.com/opsd-io/terraform-module-aws-backend?ref=VERSION"
  bucket_name = "my-infrastructure-terraform-state"
}
```

**IMPORTANT**: Make sure not to pin to master because there may be breaking changes between releases.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_iam_policy.state_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_kms_alias.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_ownership_controls.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_iam_policy_document.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.state_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 Bucket to use for state storage. | `string` | n/a | yes |
| <a name="input_bucket_server_side_encryption"></a> [bucket\_server\_side\_encryption](#input\_bucket\_server\_side\_encryption) | If true, enables S3 bucket server-side encryption. | `bool` | `true` | no |
| <a name="input_bucket_tags"></a> [bucket\_tags](#input\_bucket\_tags) | A map of tags to assign to the bucket. | `map(string)` | `{}` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | A map of tags to assign to every resource in this module. | `map(string)` | `{}` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | The name of DynamoDB Table to use for state locking and consistency. | `string` | `null` | no |
| <a name="input_dynamodb_table_tags"></a> [dynamodb\_table\_tags](#input\_dynamodb\_table\_tags) | A map of tags to assign to the table. | `map(string)` | `{}` | no |
| <a name="input_iam_policy_name"></a> [iam\_policy\_name](#input\_iam\_policy\_name) | The name of the IAM policy to provide Terraform state access. | `string` | `null` | no |
| <a name="input_iam_policy_path"></a> [iam\_policy\_path](#input\_iam\_policy\_path) | Path in which to create the policy. | `string` | `"/"` | no |
| <a name="input_iam_policy_tags"></a> [iam\_policy\_tags](#input\_iam\_policy\_tags) | A map of tags to assign to the IAM policy. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the S3 Bucket. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the S3 Bucket to use for state storage. |
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | The ARN of the DynamoDB Table. |
| <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name) | The name of DynamoDB Table to use for state locking and consistency. |
| <a name="output_region"></a> [region](#output\_region) | The region of the state storage resources. |
| <a name="output_state_access_policy_arn"></a> [state\_access\_policy\_arn](#output\_state\_access\_policy\_arn) | The ARN of the state access policy providing Terraform state access. |
| <a name="output_state_access_policy_name"></a> [state\_access\_policy\_name](#output\_state\_access\_policy\_name) | The name of the state access policy providing Terraform state access. |
<!-- END_TF_DOCS -->

## Examples of usage

Do you want to see how the module works? See all the [usage examples](examples).

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
