resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
 
  tags = {
    Name = var.vpc_name
  }
}

##### Public subnet setup #####
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

################################

##### Private subnet setup #####
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
 
  tags = {
    Name = "${var.vpc_name}-private_subnet${count.index + 1}"
  }
}

resource "aws_eip" "elastic_ip_nat" {
  count  = length(var.azs)

  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-elastic_ip_nat${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.azs)

  allocation_id = aws_eip.elastic_ip_nat[count.index].id
  subnet_id     = aws_subnet.private_subnets[count.index].id

  tags = {
    Name = "${var.vpc_name}-nat_gateway${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_route_table" "private_route_table" {
  count  = length(var.azs)

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }

  tags = {
    Name = "${var.vpc_name}-private_route_table${count.index + 1}"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  count          = length(var.private_subnet_cidrs)

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}
################################

 