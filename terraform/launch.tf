resource "aws_instance" "ec2" {
  ami                    = "ami-0dc2d3e4c0f9ebd18"
  instance_type          = "t2.micro"
  key_name               = "mykey"
  vpc_security_group_ids = ["sg-b63c1eb4"]
}


provider "aws" {
  region                 = "us-east-1"
}

resource "local_file" "key" {
  filename = "mykey.pem"
}

resource "null_resource" "ansible" {
  provisioner "remote-exec" {
    connection {
      host            = aws_instance.ec2.host_id
      type            = "ssh"
      user            = "ec2-user"
      private_key      = local_file.key
      }

    inline = [
      "sudo yum install python3-pip -y",
      "sudo pip3 install pip --upgrade",
      "sudo pip3 install ansible==4.1.0",
      "ansible-pull -i localhost, -U https://github.com/Cloudecoder/project.git//roles/ansible.yml"
    ]

  }

}














