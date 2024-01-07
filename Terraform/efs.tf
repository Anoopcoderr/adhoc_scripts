provider "aws" {
  region = "us-east-1"  # Set your desired AWS region
}

resource "aws_efs_file_system" "example_efs" {
  creation_token = "example-efs"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "Allow inbound NFS traffic"
}

resource "aws_security_group_rule" "example_sg_rule" {
  security_group_id = aws_security_group.example_sg.id
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_efs_mount_target" "example_mount_target" {
  count          = 2
  file_system_id = aws_efs_file_system.example_efs.id
  subnet_id      = element(["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"], count.index)
  security_groups = [aws_security_group.example_sg.id]
}

output "efs_dns_name" {
  value = aws_efs_file_system.example_efs.dns_name
}
