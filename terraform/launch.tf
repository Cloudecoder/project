resource "aws_instance" "ec2" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "t2.micro"
  key_name               = "mykey"
  vpc_security_group_ids = ["sg-b63c1eb4"]
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = "vpc-65189718"
  service_name = "com.amazonaws.us-east-1.s3"
}

provider "aws" {
  region                 = "us-east-1"
}



















//resource "aws_spot_instance_request" "launch" {
//  count          = 2
//  ami            = "ami-0dc2d3e4c0f9ebd18"
//  instance_type  = "t2.micro"
//  spot_price     = "0.0116"
//  vpc_security_group_ids = ["sg-078ae966242083129"]
//}
//
//provider "aws" {
//  region = "us-east-1"
//}
