terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.7.7"
    }

  }
  backend "s3" {
    bucket = "remote-state-lock"
    key = "robo-manual"
    region = "us-east-1"
    dynamodb_table = "dynamodb-remote-state-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}
