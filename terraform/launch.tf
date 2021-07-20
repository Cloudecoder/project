resource "aws_instance" "ec2" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "t2.micro"
  key_name               = "mykey"
  vpc_security_group_ids = ["sg-b63c1eb4"]
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id       = "vpc-65189718"
  service_name = "com.amazonaws.us-east-1.ec2"
}

provider "aws" {
  region                 = "us-east-1"
}

variable "key_name" {}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}


resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    connection {
      host            = "100.26.173.250"
      type            = "ssh"
      user            = "ec2-user"
      private_key     = var.key_name
      }

    inline = [
      "sudo yum install python3-pip -y",
      "sudo pip3 install pip --upgrade",
      "sudo pip3 install ansible==4.1.0",
      "ansible-pull -i localhost, -U https://github.com/Cloudecoder/project.git roles/ansible.yml"
    ]

  }

}














