output "alb_sg_id" {
  description = "Security group ID attached to the ALB"
  value       = aws_security_group.alb.id
}

output "instance_sg_id" {
  description = "Security group ID attached to the web tier instances"
  value       = aws_security_group.instance.id
}
