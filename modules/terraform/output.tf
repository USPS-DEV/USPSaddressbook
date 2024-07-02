output "terraform_public_ip" {
  value = aws_instance.usps_terraform_node.id
}


output "ami" {
  value = data.aws_ami.ubuntu.id
}