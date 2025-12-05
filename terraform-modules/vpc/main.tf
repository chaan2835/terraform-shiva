resource "aws_vpc" "this" {
    cidr_block = var.cidr # no on can change the value of cidr block if we use local variable if we use variable anyone can change the value
    instance_tenancy = "default"
    tags = var.tags
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = var.igw_tags
}

resource "aws_subnet" "public" {
  for_each = toset(local.azs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = each.value
  tags = var.public_subnet_tags-each.value
}

resource "aws_subnet" "private" {
  for_each = toset(local.azs)  
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = each.value
  tags = var.private_subnet_tags-each.value
}

resource "aws_subnet" "DB" {
  for_each = toset(local.azs)
  vpc_id     = aws_vpc.this.id
  cidr_block = var.db_subnet_cidr[count.index]
  availability_zone = each.value
  tags = var.DB_subnet_tags-each.value
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = var.public_route_table_tags
}

resource "aws_eip" "eip" {
  
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id

  tags = var.nat_tags
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.this.id
  }

  tags = var.private_route_table_tags
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "DB" {
  subnet_id      = aws_subnet.DB.id
  route_table_id = aws_route_table.private.id
}
