##### S3 VPCE setup #####

resource "aws_vpc_endpoint" "vpc_endpoint_s3" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = setunion([aws_route_table.public_route_table.id], aws_route_table.private_route_table[*].id)

  tags = {
    Name = "${var.vpc_name}-vpc_endpoint_s3"
  }
}
