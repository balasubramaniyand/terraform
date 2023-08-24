# Terraform Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

# Create 4 S3 Buckets
resource "aws_s3_bucket" "mys3bucket" {

  # for_each Meta-Argument
  for_each = {
    my  = "bucket"
    qa   = "bucket01"
    tag = "tag1"
    prod = "my-papp"
  }

  bucket = "${each.key}-${each.value}"    # qa-bucket01
  acl    = "private"

  tags = {
    Environment = each.key                      # my
    bucketname  = "${each.key}-${each.value}"   # 
    eachvalue   = each.value                    # bucket
  }
}
