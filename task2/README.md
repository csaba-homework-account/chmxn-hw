## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/s3 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name | `string` | `"example-bucket"` | no |
| <a name="input_iam_role_backup_uploader"></a> [iam\_role\_backup\_uploader](#input\_iam\_role\_backup\_uploader) | The ARN of the role dedicated for backup pushes | `string` | `"arn:aws:iam::123456789012:role/backup_uploader"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region | `string` | `"eu-central-1"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days of data retention | `string` | `180` | no |
| <a name="input_standard_ia_transition_in_days"></a> [standard\_ia\_transition\_in\_days](#input\_standard\_ia\_transition\_in\_days) | Specifies the number of days of data transition to Standard IA | `string` | `90` | no |

## Outputs

No outputs.
