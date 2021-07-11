resource "aws_instance" "sample" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "t2.micro"

}

terraform {
  backend "s3" {
    bucket               = "storetf"
    key                  = "sample/terraform.tfstate"
    region               = "us-east-1"
    dynamodb_table       = "terraform"
  }
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
