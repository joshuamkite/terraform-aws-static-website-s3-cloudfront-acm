
terraform {
  required_version = ">= 1.2.8"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.29.0"
      configuration_aliases = [aws.us-east-1]
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
  default_tags {
    tags = var.tags
  }
}
