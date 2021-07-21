resource "aws_instance" "ec2" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "t2.micro"
  key_name               = "mykey"
  vpc_security_group_ids = ["sg-b63c1eb4"]

}

resource "aws_ec2_tag" "tag" {
  key = "Name"
  resource_id = [aws_instance.ec2.id]
  value = "webserver"
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = "vpc-65189718"
  service_name      = "com.amazonaws.us-east-1.ec2"
  vpc_endpoint_type = "Interface"

  security_group_ids = [aws_instance.ec2.vpc_security_group_ids]

  private_dns_enabled = true
}

provider "aws" {
  region                 = "us-east-1"
}

terraform {
  backend "s3" {
    bucket           = "storetf"
    key              = "terraform/tfstate"
    region           = "us-east-1"
    dynamodb_table   = "terraform"
  }
}


//resource "null_resource" "ansible" {
//  provisioner "remote-exec" {
//    connection {
//      host            = aws_spot_instance_request.ec2.public_ip
//      type            = "ssh"
//      user            = "ec2-user"
//      private_key     = "file(~/terraform/mykey)"
//      }
//
//    inline = [
//      "sudo yum install python3-pip -y",
//      "sudo pip3 install pip --upgrade",
//      "sudo pip3 install ansible==4.1.0",
//      "ansible-pull -i localhost, -U https://github.com/Cloudecoder/project.git//roles/ansible.yml"
//    ]
//
//  }
//
//}
//
//












