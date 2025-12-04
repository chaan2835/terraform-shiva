resource "aws_vpc" "vpc" {
    cidr_block = local.cidr # no on can change the value of cidr block if we use local variable if we use variable anyone can change the value
    instance_tenancy = "default"
    tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = var.igw_tags
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.3.2.0/24"

  tags = var.public_subnet_tags
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.3.3.0/24"

  tags = var.private_subnet_tags
}

resource "aws_subnet" "DB-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.3.4.0/24"

  tags = var.DB_subnet_tags
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = var.public_route_table_tags
}

resource "aws_eip" "eip" {
  
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = var.nat_tags
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = var.private_route_table_tags
}

resource "aws_route_table_association" "public-route-table-association" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-route-table-association" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "DB-route-table-association" {
  subnet_id      = aws_subnet.DB-subnet.id
  route_table_id = aws_route_table.private-route-table.id
}
