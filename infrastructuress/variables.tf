variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
}

variable "bastion_ami" {
  description = "AMI for bastion host (Amazon Linux 2)"
  type        = string
}

variable "instance_type" {
  description = "Instance type for app servers"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name for bastion host (optional if SSM only)"
  type        = string
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
}

variable "project_name" {
  description = "Prefix for resources"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "email_alert" {
  description = "SNS alert email"
  type        = string
}

variable "protocol" {
  description = "Protocol"
  type        = string
}
variable "port" {
  description = "Port"
  type        = string
}