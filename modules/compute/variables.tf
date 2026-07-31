variable "name_prefix" {
  description = "Prefix used for naming all resources in this module"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to deploy the ALB and target group into"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs (at least 2, in different AZs) for the ALB and ASG"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID to attach to the ALB"
  type        = string
}

variable "instance_sg_id" {
  description = "Security group ID to attach to the web tier instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the web tier"
  type        = string
}

variable "min_size" {
  description = "Minimum ASG size"
  type        = number
}

variable "max_size" {
  description = "Maximum ASG size"
  type        = number
}

variable "desired_capacity" {
  description = "Desired ASG size"
  type        = number
}

variable "enable_container" {
  description = "If true, run the containerised page instead of bare NGINX"
  type        = bool
}

variable "container_image" {
  description = "Container image to run when enable_container = true"
  type        = string
}
