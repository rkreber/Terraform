terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.00"
    }
  }
}

provider "aws" {
  region = var.region

  assume_role {
    role_arn = var.role_arn
  }

  default_tags {
    tags = {
      Account   = "rkreber"
      Region    = "US-EAST-1"
      Terraform = "True"
    }
  }
}