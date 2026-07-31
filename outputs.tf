output "alb_dns_name" {
  description = "Public DNS name of the load balancer - hit this in a browser to see the NGINX welcome page"
  value       = module.compute.alb_dns_name
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.compute.asg_name
}

output "vpc_id" {
  description = "ID of the VPC created for this stack"
  value       = module.network.vpc_id
}
