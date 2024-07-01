resource "aws_instance" "usps_jenkins_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address

  tags = {
    Name = var.instance_tags
  }
}