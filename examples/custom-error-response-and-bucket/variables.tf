
variable "domain_name" {
  type        = string
  description = "Domain name for website, used for all resources"
}

variable "region" {
  type        = string
  description = "Region for our region-optional resources"
  default     = "eu-west-1"
}

variable "tags" {
  type        = map(string)
  description = "Provider default tags, applied to all resources"
  default = {
    managed_by_terraform = true
    terraform_module     = "joshuamkite/static-website-s3-cloudfront-acm/aws"
  }
}

variable "cloudfront_custom_error_responses" {
  type = list(any)
  default = [
    {
      error_code            = 403
      response_code         = 404
      error_caching_min_ttl = 10
      response_page_path    = "/404.html"
    },
    {
      error_code            = 404
      response_code         = 404
      error_caching_min_ttl = 10
      response_page_path    = "/404.html"
    }
  ]
}