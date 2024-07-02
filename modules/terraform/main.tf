resource "aws_instance" "usps_terraform_node" {
  ami = data.aws_ami.ubuntu.id
  key_name = var.key_name
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    "Name" = "usps_terraform_node"
  }

  user_data = file("${path.module}/userdata.sh")
}