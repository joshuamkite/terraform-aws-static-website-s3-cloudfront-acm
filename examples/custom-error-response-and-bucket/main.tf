module "static-website-s3-cloudfront-acm" {
  source                = "../../"
  domain_name           = var.domain_name
  deploy_sample_content = true
  providers = {
    aws.us-east-1 = aws.us-east-1
    aws           = aws
  }
  s3_bucket_custom_name = "${var.domain_name}-${var.region}-${data.aws_caller_identity.current.account_id}"
  custom_error_response = var.custom_error_response
}

# used to populate custom bucket name
data "aws_caller_identity" "current" {}