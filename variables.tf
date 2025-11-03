variable "domain_name" {
  type        = string
  description = "Domain name for website, used for all resources"
}

variable "parent_zone_name" {
  type        = string
  description = "Parent hosted zone name (for subdomains). If not set, uses domain_name"
  default     = ""
}

variable "cloudfront_price_class" {
  type        = string
  default     = "PriceClass_100" # Only US,Canada,Europe
  description = "CloudFront distribution price class"
}

# All values for the TTL are important when uploading static content that changes
# https://stackoverflow.com/questions/67845341/cloudfront-s3-etag-possible-for-cloudfront-to-send-updated-s3-object-before-t
variable "cloudfront_min_ttl" {
  type        = number
  default     = 0
  description = "The minimum TTL for the cloudfront cache"
}

variable "cloudfront_default_ttl" {
  type        = number
  default     = 86400
  description = "The default TTL for the cloudfront cache"
}

variable "cloudfront_max_ttl" {
  type        = number
  default     = 31536000
  description = "The maximum TTL for the cloudfront cache"
}

variable "cloudfront_minimum_protocol_version" {
  type        = string
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
  default     = "TLSv1.2_2019"
}

variable "deploy_sample_content" {
  type        = bool
  default     = false
  description = "Deploy sample content to show website working?"
}

variable "cloudfront_default_root_object" {
  type        = string
  description = "Default root object for cloudfront. Need to also provide custom error response if changing from default"
  default     = "index.html"
}

variable "s3_bucket_custom_name" {
  type        = string
  description = "Any non-empty string here will replace default name of bucket `var.domain_name`"
  default     = ""
}

variable "s3_bucket_versioning" {
  type        = bool
  description = "Apply versioning to S3 bucket?"
  default     = false
}

variable "s3_bucket_public_access_block" {
  type        = bool
  description = "Apply public access block to S3 bucket?"
  default     = true
}

variable "cloudfront_custom_error_responses" {
  type = list(object({
    error_code            = number
    response_code         = number
    error_caching_min_ttl = number
    response_page_path    = string
  }))
  description = "See https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GeneratingCustomErrorResponses.html"
  default = [
    {
      error_code            = 403
      response_code         = 404
      error_caching_min_ttl = 10
      response_page_path    = "/index.html"
    },
    {
      error_code            = 404
      response_code         = 404
      error_caching_min_ttl = 10
      response_page_path    = "/index.html"
    }
  ]
}
