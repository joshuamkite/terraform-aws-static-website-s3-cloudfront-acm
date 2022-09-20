output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.this.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.this.id
  description = "deprecated and will be removed - use `s3_bucket_id`"
}

output "s3_bucket_id" {
  value = aws_s3_bucket.this.id
}

output "acm_certificate_id" {
  value = aws_acm_certificate.this.id
}