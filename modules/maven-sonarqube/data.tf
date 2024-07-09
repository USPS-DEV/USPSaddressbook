data "aws_ami" "redhat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL_HA-9.3.0_HVM-20231101-x86_64-5-Hourly2-GP2"]  # Change the filter to match the desired RedHat AMI pattern
  }

  filter {
    name   = "owner-id"
    values = ["309956199498"]  # RedHat owner ID in AWS
  }

  owners = ["309956199498"]  # RedHat owner ID in AWS
}

