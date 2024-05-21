##### Public subnet config #####
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-internet_gateway"
  }
}

resource "aws_subnet" "public_subnets" {
   count             = length(var.public_subnet_cidrs)

   vpc_id            = aws_vpc.vpc.id
   cidr_block        = element(var.public_subnet_cidrs, count.index)
   availability_zone = element(var.azs, count.index)
 
   tags = {
     Name = "${var.vpc_name}-public_subnet${count.index + 1}"
   }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.vpc_name}-public_route_table"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count          = length(var.public_subnet_cidrs)

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
