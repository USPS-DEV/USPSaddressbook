resource "aws_instance" "usps_jenkins_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = file("${path.module}/install_jenkins.sh")
  tags = {
    Name = var.instance_tags
  }
}