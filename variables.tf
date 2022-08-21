variable "domain_name" {
  type        = string
  description = "Domain name for website, used for all resources"
}

variable "price_class" {
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
  description = "Whether or not to deploy sample content"
}

variable "default_root_object" {
  type        = string
  description = "Default root object for cloudfront"
  default     = "index.html"
}

variable "aws_s3_bucket_versioning" {
  type        = bool
  description = "Apply versioning to S3 bucket?"
  default     = true
}

variable "public_access_block" {
  type        = bool
  description = "Apply public access block to S3 bucket?"
  default     = true
}
