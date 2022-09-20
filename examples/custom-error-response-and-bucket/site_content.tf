resource "aws_s3_object" "custom_error_page" {
  bucket       = module.static-website-s3-cloudfront-acm.s3_bucket_name
  key          = "404.html"
  content      = local.error_html
  content_type = "text/html"
}

locals {
  error_html = templatefile("${path.module}/site_content/404.html.tftpl", {
    domain_name = var.domain_name
  })
}
