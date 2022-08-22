locals {
  s3_origin_id   = "${var.domain_name}-cloudfront-orgin-id"
  s3_bucket_name = var.s3_bucket_custom_name == "" ? var.domain_name : var.s3_bucket_custom_name
}
