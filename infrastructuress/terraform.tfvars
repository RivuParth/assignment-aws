environment     = "parth"
project_name    = "aws-iac-project"
region          = "us-east-1"
email_alert     = "parthbhowmick00@gmail.com"
protocol        = "HTTP"
port            = 80
db_name         = "myappdb"
db_password     = "admin123"
db_username     = "admin123"
key_name        = ""
instance_type   = "t3.micro"
bastion_ami     = "ami-0c02fb55956c7d316"
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_cidr        = "10.0.0.0/16"
aws_region      = "us-east-1"