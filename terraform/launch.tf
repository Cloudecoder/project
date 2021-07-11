resource "aws_spot_instance_request" "launch" {
  count          = 2
  ami            = "ami-0dc2d3e4c0f9ebd18"
  instance_type  = "t2.micro"
  spot_price     = "0.0116"
  vpc_security_group_ids = ["sg-078ae966242083129"]

}

//resource "aws_security_group" "allow_tls" {
//  name        = "allow_ssh"
//  description = "Allow SSH inbound traffic"
//
//  ingress {
//    description      = "TLS from VPC"
//    from_port        = 22
//    to_port          = 22
//    protocol         = "tcp"
//    cidr_blocks      = ["0.0.0.0/0"]
//
//  }
//
//  ingress {
//    description      = "TLS from VPC"
//    from_port        = 80
//    to_port          = 80
//    protocol         = "http"
//    cidr_blocks      = ["0.0.0.0/0"]
//
//  }
//
//  egress {
//    from_port        = 0
//    to_port          = 0
//    protocol         = "-1"
//    cidr_blocks      = ["0.0.0.0/0"]
//    ipv6_cidr_blocks = ["::/0"]
//  }
//
//  tags = {
//    Name = "allow_ssh"
//  }
//}

