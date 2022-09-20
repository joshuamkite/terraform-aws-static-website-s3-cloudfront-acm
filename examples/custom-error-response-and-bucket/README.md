# simple-complete-website-with-sample-content

This deploys a complete example website with sample content. Non specific-regional-mandated resources are deployed to eu-west-1

A custom bucket name is specified based on the deployed aws region and account id

A custom 404 error page linking back to the domain homepage is created outboard of the module and referenced for custom error responses for 403 and 404 errors

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.31.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_static-website-s3-cloudfront-acm"></a> [static-website-s3-cloudfront-acm](#module\_static-website-s3-cloudfront-acm) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_s3_object.custom_error_page](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_custom_error_responses"></a> [cloudfront\_custom\_error\_responses](#input\_cloudfront\_custom\_error\_responses) | n/a | `list(any)` | <pre>[<br>  {<br>    "error_caching_min_ttl": 10,<br>    "error_code": 403,<br>    "response_code": 404,<br>    "response_page_path": "/404.html"<br>  },<br>  {<br>    "error_caching_min_ttl": 10,<br>    "error_code": 404,<br>    "response_code": 404,<br>    "response_page_path": "/404.html"<br>  }<br>]</pre> | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for website, used for all resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for our region-optional resources | `string` | `"eu-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Provider default tags, applied to all resources | `map(string)` | <pre>{<br>  "managed_by_terraform": true,<br>  "terraform_module": "joshuamkite/static-website-s3-cloudfront-acm/aws"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_id"></a> [acm\_certificate\_id](#output\_acm\_certificate\_id) | n/a |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | n/a |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | n/a |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | n/a |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | n/a |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | n/a |
