# test-task
# 🚀 ECS EC2 Launch-Type Production Deployment (Terraform)

This setup provisions a simplified, production-grade environment on AWS using ECS (EC2 Launch Type) for a containerized application.

## 📦 Architecture Overview
- Region: `eu-west-1`
- ECS Cluster (EC2 Launch Type)
- Application Load Balancer
- Auto Scaling Group
- Amazon ECR (image repo)
- Secrets Manager (MySQL creds)
- RDS MySQL (private)
- Bastion Host (SSH access)
- CloudWatch Logs & Alarms

## 🔧 Setup Instructions

### 1. Prerequisites
- Terraform v1.3+
- AWS CLI configured with access
- SSH Key pair created in AWS (`my-keypair`)

### 2. Initialize and Apply
```bash
terraform init
terraform plan
terraform apply -auto-approve
```

### 3. Accessing the Application
- After deployment, grab the output: `alb_dns_name`
- Open in browser: `http://<alb_dns_name>` (shows Nginx welcome page)

### 4. Bastion Host Access
```bash
ssh -i task-key.pem ec2-user@<bastion_public_ip>
```

### 5. Secrets Management
- Stored in AWS Secrets Manager (`mysql-credentials`)
- Injected automatically into ECS containers using `secrets` block in task definition

### 6. Logging & Monitoring
- ECS logs stream to CloudWatch Logs: `/ecs/<cluster_name>`
- CloudWatch alarm on high CPU (>75%) for ECS cluster
- SNS Topic can notify email/Slack

## ✅ Notes
- MySQL is launched in **private subnet** and is **not publicly accessible**
- ECS EC2 instances are launched in private subnet via Auto Scaling Group


## 📁 Modules Used
- `modules/vpc`
- `modules/ecr`
- `modules/alb`
- `modules/ecs`
- `modules/mysql`
- `modules/secrets`
- `modules/cloudwatch`
- `modules/ec2-bastion`
- `modules/iam`

## 📌 Assumptions
- You have a basic `nginx` container pushed to ECR
- You want a simplified, low-cost demo that reflects real prod principles

---
