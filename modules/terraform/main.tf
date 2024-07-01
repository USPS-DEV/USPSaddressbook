resource "aws_instance" "usps_terraform_node" {
  ami = var.ami

  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    "Name" = "usps_terraform_node"
  }

  user_data = file("${path.module}/userdata.sh")
}