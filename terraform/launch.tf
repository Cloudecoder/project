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

resource "null_resource" "ansible-apply" {
   provisioner "remote-exec" {
    connection {
      host            = "ec2-100-26-173-250.compute-1.amazonaws.com"
      user            = "ec2-user"
      ssh_private_key     = file("/roles/mykey.pem")
    }

    inline = [
      "sudo yum install python3-pip -y",
      "sudo pip3 install pip --upgrade",
      "sudo pip3 install ansible==4.1.0",
      "ansible-pull -i localhost, -U https://github.com/Cloudecoder/project.git roles/ansible.yml"
    ]

  }
}















