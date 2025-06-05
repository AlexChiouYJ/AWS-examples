terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_bucket_object" "object" {
  bucket = resource aws_s3_bucket default
  key    = "myfile.txt"
  source = "myfile.txt"
}