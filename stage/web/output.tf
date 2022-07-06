output "vpc" {
value = data.aws_vpc.vpc.id
}
 
output "vpc-arn" {
  value = data.aws_vpc.vpc.arn
}
 
output "vpc-name" {
  value = data.aws_vpc.vpc.cidr_block
}

output "alb_dns_name" {
  value       = aws_lb.example1.dns_name
  description = "The domain name of the load balancer"
}
output "subnet-ids" {

  value = data.aws_subnets.subnets.ids

}


