resource "aws_vpc" "main-vpc" { # this name is for terraform puposes
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "automated-main-vpc" # this name is for AWS console purposes
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "automated-public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "automated-private-subnet"
  }
}

resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "automated-internet-gw"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_eip" "elastic-ip" {

  tags = {
    Name = "NAT-EIP"
  }
}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "NAT-Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet-gw]
}
  

resource "aws_route_table" "private-route-table" { # for private rt we need nat gateway
  vpc_id = aws_vpc.main-vpc.id
   route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }
  tags = {
    Name = "private-route-table"
  }
}