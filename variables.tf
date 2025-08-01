# variables.tf

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b"]
}

variable "key_name" {
  description = "SSH key pair name for bastion host"
  default     = "task-key"
}

variable "db_username" {
  description = "Master username for MySQL"
  default     = "admin"
}

variable "db_password" {
  description = "Master password for MySQL"
  default     = "Ketan@1234"
  sensitive   = true
}

variable "container_name" {
  description = "Name of the ECS container"
  default     = "nginx-repo"
}

variable "container_port" {
  description = "Port container listens on"
  type        = number
  default     = 80
}

variable "instance_type" {
  description = "EC2 instance type for ECS and Bastion"
  type        = string
  default     = "t3.micro"
}
variable "repository_name" {
  description = "Name of the ECR repository"
  default     = "my-repo"
}
