resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name != "" ? var.key_name : null
  iam_instance_profile        = aws_iam_instance_profile.ec2_instance_profile.name

  tags = {
    Name = "${var.environment}-bastion"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y amazon-ssm-agent
              systemctl enable amazon-ssm-agent
              systemctl start amazon-ssm-agent
              EOF
}
