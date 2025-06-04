variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "bastion_ami" {
  description = "AMI for bastion host (Amazon Linux 2)"
  type        = string
  default     = "ami-0c02fb55956c7d316" # update with latest AMI per region
}

variable "instance_type" {
  description = "Instance type for app servers"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "SSH key pair name for bastion host (optional if SSM only)"
  type        = string
  default     = "" 
}


variable "db_username" {
  description = "RDS master username"
  type        = string
  default     = "admin123"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  default     = "admin123"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "myappdb"
}

