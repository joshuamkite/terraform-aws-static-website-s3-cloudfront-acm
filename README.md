# terraform-aws-static-website-s3-cloudfront-acm

This Terraform deploys resources for a public static website using AWS S3 and Cloudfront with TLS and a public DNS entry together with a suitable ACM certificate and validation. The apex domain is aliased to the www subdomain. This is a useful base from which to deploy website content with e.g. Hugo. Optionally a sample webpage with text and an image may be deployed to demonstrate that the website is working. This code presumes that a hosted zone already exists in the same account for the domain in question - this is automatically provisioned for public domain names registered via Route53 as opposed to transferred from another provider. There are a bewilderment of options available for Cloudfront and S3. It simply isn't practical to include all possible options here. The choices made are appropriate for a personal website.

This module is also published to the [Terraform community module registry](https://registry.terraform.io/modules/joshuamkite/static-website-s3-cloudfront-acm/aws/latest)

## Changes

Release 2.0 moves from `aws_cloudfront_origin_access_identity` to `aws_cloudfront_origin_access_control` in accord with [AWS latest recommended practice](https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-cloudfront-introduces-origin-access-control-oac/). 

## Upgrading from version 1.0.0 => 2.0.0

In the unlikely event that you wish to upgrade between versions without a full `destroy` and `apply`, it is possible to resolve the error
```terraform
│ Error: CloudFrontOriginAccessIdentityInUse: The CloudFront origin access identity is still being used.
```
with
```bash
terraform destroy -target module.static-website-s3-cloudfront-acm.aws_cloudfront_distribution.this
```
Note that this will also destroy the dependent resources
```terraform
module.static-website-s3-cloudfront-acm.aws_route53_record.domain_name
module.static-website-s3-cloudfront-acm.aws_s3_bucket_policy.this
```
And your website will be temporarily unavailable. Then do
```bash
terraform apply
```
to destroy the orphaned `aws_cloudfront_origin_access_identity` and restore the 'missing' resources.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.29.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.29.0 |
| <a name="provider_aws.us-east-1"></a> [aws.us-east-1](#provider\_aws.us-east-1) | >= 4.29.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_control.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_route53_record.domain_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.www_domain_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_object.sample_image](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.sample_index_html](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudfront_default_root_object"></a> [cloudfront\_default\_root\_object](#input\_cloudfront\_default\_root\_object) | Default root object for cloudfront | `string` | `"index.html"` | no |
| <a name="input_cloudfront_default_ttl"></a> [cloudfront\_default\_ttl](#input\_cloudfront\_default\_ttl) | The default TTL for the cloudfront cache | `number` | `86400` | no |
| <a name="input_cloudfront_max_ttl"></a> [cloudfront\_max\_ttl](#input\_cloudfront\_max\_ttl) | The maximum TTL for the cloudfront cache | `number` | `31536000` | no |
| <a name="input_cloudfront_min_ttl"></a> [cloudfront\_min\_ttl](#input\_cloudfront\_min\_ttl) | The minimum TTL for the cloudfront cache | `number` | `0` | no |
| <a name="input_cloudfront_minimum_protocol_version"></a> [cloudfront\_minimum\_protocol\_version](#input\_cloudfront\_minimum\_protocol\_version) | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. | `string` | `"TLSv1.2_2019"` | no |
| <a name="input_cloudfront_price_class"></a> [cloudfront\_price\_class](#input\_cloudfront\_price\_class) | CloudFront distribution price class | `string` | `"PriceClass_100"` | no |
| <a name="input_deploy_sample_content"></a> [deploy\_sample\_content](#input\_deploy\_sample\_content) | Deploy sample content to show website working? | `bool` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for website, used for all resources | `string` | n/a | yes |
| <a name="input_s3_bucket_custom_name"></a> [s3\_bucket\_custom\_name](#input\_s3\_bucket\_custom\_name) | Any non-empty string here will replace default name of bucket `var.domain_name` | `string` | `""` | no |
| <a name="input_s3_bucket_public_access_block"></a> [s3\_bucket\_public\_access\_block](#input\_s3\_bucket\_public\_access\_block) | Apply public access block to S3 bucket? | `bool` | `true` | no |
| <a name="input_s3_bucket_versioning"></a> [s3\_bucket\_versioning](#input\_s3\_bucket\_versioning) | Apply versioning to S3 bucket? | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_id"></a> [acm\_certificate\_id](#output\_acm\_certificate\_id) | n/a |
| <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id) | n/a |
| <a name="output_cloudfront_domain_name"></a> [cloudfront\_domain\_name](#output\_cloudfront\_domain\_name) | n/a |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | n/a |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | n/a |
