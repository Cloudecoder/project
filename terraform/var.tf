resource "local_file" "key" {
  filename = "${path.module}/mykey.pem"
}


output "key_pair" {
  value = local_file.key.filename
}