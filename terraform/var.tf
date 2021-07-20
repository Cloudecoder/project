resource "aws_key_pair" "connect" {
  key_name = "mykey.pem"
  public_key = file("${path.module}C:/Users/RYZEN/IdeaProjects/project/roles")
}

output "key_pair" {
  value = aws_key_pair.connect
}