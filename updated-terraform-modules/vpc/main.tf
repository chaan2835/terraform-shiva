#creating vpc
resource "aws_vpc" "this2" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.tags, var.vpc_tags)
}

#creating internet gateway
resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.this2.id
  tags  = merge(var.tags,var.igw_tags)
}

# creating 2 public subnets
resource "aws_subnet" "public" {
  count            = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.this2.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags= merge(var.tags,var.public_subet_tags, {Name= var.public_subet_Names[count.index]})
}

#creating route table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this2.id
  tags = merge(var.tags,var.public_route_table_tags, {Name = var.public_route_table_Name})
}

#adding igw to public route table
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.public.id
}

#associating public subnets with public route table 
resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidr)
  subnet_id = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id  
}

#creating 2 private subnets
resource "aws_subnet" "private" {
  count            = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.this2.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags= merge(var.tags,var.private_subet_tags, {Name= var.private_subet_Names[count.index]})
}

# creating EIP for NAT Gateway
resource "aws_eip" "main" {

}

# creating NAT Gateway for private subnets
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id = aws_subnet.public[0].id
  tags = merge(var.tags,var.igw_tags)
  depends_on = [ aws_internet_gateway.public ]
}

# creating private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this2.id
  tags = merge(var.tags,var.private_route_table_tags, {Name = var.private_route_table_Name})
}

#adding nat to private route table
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.main.id
}

#associating private subnets with private route table
resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidr)
  subnet_id = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id  
}

#creating 2 private subnets for database
resource "aws_subnet" "database" {
  count            = length(var.database_subnet_cidr)
  vpc_id = aws_vpc.this2.id
  cidr_block = var.database_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags= merge(var.tags,var.database_subet_tags, {Name= var.database_subet_Names[count.index]})
}

# creating database route table
resource "aws_route_table" "database" {
  vpc_id = aws_vpc.this2.id
  tags = merge(var.tags,var.database_route_table_tags, {Name = var.database_route_table_Name})
}

# adding nat to database route table
resource "aws_route" "database" {
  route_table_id         = aws_route_table.database.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.main.id
}

# associating database subnets with database route table
resource "aws_route_table_association" "database" {
  count = length(var.database_subnet_cidr)
  subnet_id = element(aws_subnet.database[*].id, count.index)
  route_table_id = aws_route_table.database.id  
}

# creating db subnet group to db  
resource "aws_db_subnet_group" "database" {
  name = lookup(var.tags,"Name")
 subnet_ids = aws_subnet.database[*].id
 tags = merge(var.tags,var.database_subnet_group_tags)
}