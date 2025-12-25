terraform {
  required_version = ">= 1.5.0"

  # 1. Backend S3 (Kunnach f s-s7aba)
  backend "s3" {
    bucket         = "terraform-state-aksil"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }

  # 2. Required Providers (Diriha ghir MERRA WA7DA hna)
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 3. Provider Configuration
provider "aws" {
  region = "us-east-1"
}
