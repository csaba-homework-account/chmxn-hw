output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "vpc_endpoint_s3" {
  description = "S3 VPC Endpoint ID"
  value       = aws_vpc_endpoint.vpc_endpoint_s3.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public_subnets[*].id
}


output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private_subnets[*].id
}
