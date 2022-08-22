# simple-complete-website-with-sample-content

This deploys a complete example website with sample content. Non specific-regional-mandated resources are deployed to eu-west-1

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_static-website-s3-cloudfront-acm"></a> [static-website-s3-cloudfront-acm](#module\_static-website-s3-cloudfront-acm) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for website, used for all resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for our region-optional resources | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Provider default tags, applied to all resources | `map(string)` | <pre>{<br>  "managed_by_terraform": true,<br>  "terraform_module": "joshuamkite/static-website-s3-cloudfront-acm/aws"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_acm_certificate_id"></a> [aws\_acm\_certificate\_id](#output\_aws\_acm\_certificate\_id) | n/a |
| <a name="output_aws_cloudfront_distribution_id"></a> [aws\_cloudfront\_distribution\_id](#output\_aws\_cloudfront\_distribution\_id) | n/a |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | n/a |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | n/a |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | n/a |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | n/a |
