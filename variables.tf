variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-southeast-2"
}

variable "project_name" {
  description = "Short project name, used as a prefix for resource names and tags"
  type        = string
  default     = "g360-autoheal"
}

variable "environment" {
  description = "Deployment environment name (e.g. dev, test, demo)"
  type        = string
  default     = "demo"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for the two public subnets (one per AZ)"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "instance_type" {
  description = "EC2 instance type for the web tier (kept free-tier eligible)"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling Group (N+1 baseline)"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling Group"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
  default     = 2
}

variable "allowed_http_cidr" {
  description = "CIDR allowed to reach the ALB on port 80"
  type        = string
  default     = "0.0.0.0/0"
}

variable "enable_container" {
  description = "If true, user-data pulls and runs a Docker image instead of installing NGINX directly"
  type        = bool
  default     = false
}

variable "container_image" {
  description = "Container image (registry/repo:tag) to pull and run when enable_container = true"
  type        = string
  default     = "ghcr.io/example/g360-web:latest"
}
