provider "aws" {
  region = var.region
  profile = "default"
}

resource "aws_instance" "sonarqube" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  # vpc_security_group_ids = [var.security_group_id]
  # subnet_id              = var.subnet_id
  associate_public_ip_address = true

  user_data = file("${path.module}/maven-sonarqube.sh")

  tags = {
    Name = "Maven_Sonarqube_Instance"
  }
}

resource "aws_db_subnet_group" "maven_sonarqube" {
  name        = "maven-sonarqube"
  description = "DB subnet group for SonarQube"
  subnet_ids  = ["subnet-093f5c0f9532489a0", "subnet-0f04bd80be1664542"]  # List all subnet IDs where RDS can be deployed

  tags = {
    Name = "maven-sonarqube"
  }
}

resource "aws_db_instance" "postgresql" {
  identifier               = "sonarqube-postgresql"
  allocated_storage        = 20
  engine                   = "postgres"
  engine_version           = "16"
  instance_class           = "db.t3.micro"
  db_name                  = var.db_name
  username                 = var.db_username
  password                 = var.db_password
  parameter_group_name     = "default.postgres16"
  skip_final_snapshot      = true
  publicly_accessible      = true
  vpc_security_group_ids   = [var.db_security_group_id]
  db_subnet_group_name     = var.db_subnet_group

  depends_on = [
    aws_db_subnet_group.maven_sonarqube  # Ensure RDS waits for subnet group creation
  ]
}