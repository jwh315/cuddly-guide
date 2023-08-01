terraform {
  required_version = "~> 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      foo = "bar"
      bar = "bing"
    }
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "2023-07-29-test-bucket"

  tags = {
    foo = "bar"
    bar = "wrong"
  }
}

resource "aws_sns_topic" "test" {
  name           = "test-topic"
  tracing_config = "Active"
}
