# Changelog

## 2.1

- Custom http error responses are now supported
- A new example is included demonstrating use of custom error responses and custom s3 bucket name
- Output `s3_bucket_name` is deprecated and will be removed in a future release - use `s3_bucket_id` instead. This corrects inconsistent naming only, the same resource and attribute is referenced in either case.

## 2.0

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