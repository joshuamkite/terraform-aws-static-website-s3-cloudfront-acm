terraform {
  required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = ">= 4.2.0"
      configuration_aliases = [aws.us-east-1]
    }
  }
}