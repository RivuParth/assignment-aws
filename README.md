# AWS Project: Infrastructure as Code + CI/CD Pipeline

## Overview

This repository contains the code and configuration to provision a secure, scalable AWS infrastructure using **Terraform**, deploy a simple **Python Flask** application, and automate deployments via a **GitHub Actions CI/CD pipeline**. 

---
**************************
In this project, I implemented a secure and scalable AWS infrastructure using Terraform with a simple Python Flask app deployed on EC2 instances.

Infrastructure:
I provisioned a VPC with public and private subnets. The public subnet hosts a bastion host EC2 instance, while the private subnets run an Auto Scaling Group of EC2s behind an Application Load Balancer. A managed RDS database resides in the private subnet for data storage. Security Groups and IAM roles secure access, and I used AWS Systems Manager Session Manager to connect to instances without SSH keys.

CI/CD Pipeline:
I created a GitHub Actions workflow that automatically runs Terraform commands and deploys the Flask app on every push to the main branch, enabling continuous delivery.

Monitoring:
CloudWatch Logs collect application and system logs, and CloudWatch Alarms monitor CPU usage, ensuring reliable operations.

Assumptions:
This is a demo-ready environment; credentials and sensitive info are parameterized. The Flask app is a basic example and can be replaced with any application.

**************************

---

## Architecture

- **VPC** with public and private subnets for isolation and security
- **Bastion host** (Amazon Linux 2 EC2) in the public subnet for controlled access
- **Auto Scaling Group (ASG)** of EC2 instances running the Flask app in private subnets
- **Application Load Balancer (ALB)** to distribute traffic to ASG instances
- **RDS instance** (MySQL/PostgreSQL) in private subnet for database needs
- **Security Groups** and **IAM Roles** for access control and permissions
- Use of **AWS Systems Manager (SSM) Session Manager** for secure access to EC2 instances instead of SSH
- **CloudWatch** for logs and monitoring with alarms on CPU usage

---

## Setup Instructions

### Prerequisites

- AWS account with appropriate permissions
- Terraform installed (v1.0+ recommended)
- AWS CLI configured locally
- GitHub repository with the code

### Deploy Infrastructure

1. Clone the repository  
   ```bash
   git clone https://github.com/RivuParth/assignment-aws.git
   cd assignment-aws/infrastructure


** Initialize Terraform
terraform init
terraform plan
terraform apply


Deploy Application

- The EC2 instances in the ASG launch with a user data script that installs and starts the Flask application automatically.
- Application code is minimal: a simple "Hello World" Flask app.

CI/CD Pipeline

- GitHub Actions workflow runs on every push to main branch.
- The pipeline runs Terraform commands (init, plan, apply) and deploys the app.
- Automatic infrastructure updates and application deployments on code changes.