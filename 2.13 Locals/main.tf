# Create S3 Bucket - with Input Variables 
/*
resource "aws_s3_bucket" "mys3bucket" {
  bucket = "${var.app_name}-${var.environment_name}-bucket"
  acl = "private"
  tags = {
    Name = "${var.app_name}-${var.environment_name}-bucket"
    Environment = var.environment_name
  }
}
*/


# Define Local Values
locals {
   env = "test"
}

# Create S3 Bucket - with Input Variables & Local Values
resource "aws_s3_bucket" "mys3bucket" {
  bucket = "alpha-12345"
  acl = "private"
  tags = {
    Name = "alpha-12345"
    Environment = local.env
  }
}

resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-079b5e5b3971bd10d"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1b"
 
  tags = {
    Name = "alpha-12345"
    Environment = local.env
  }
}

resource "aws_vpc" "vpc-us-west-1" {
  cidr_block = "10.1.0.0/16"
  provider = aws.san
  tags = {
    
    Name = "alpha-12345"
    Environment = local.env
  }
}
