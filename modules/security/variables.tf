variable "name_prefix" {
  description = "Prefix used for naming all resources in this module"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID the security groups belong to"
  type        = string
}

variable "allowed_http_cidr" {
  description = "CIDR block allowed to reach the ALB on port 80"
  type        = string
}
