terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.21.0"
    }
  }
  backend "s3" {
    bucket = "timing-lock-remote-state"
    key    = "session-05-count-conditions-loops"
    region = "ap-south-2"
    dynamodb_table = "timing-lock"
    
  }
}

provider "aws" {
  # Configuration options
    region = "ap-south-2"
}