resource "aws_vpc" "this2" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.tags, var.vpc_tags)
}

resource "aws_subnet" "public" {
  count            = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.this2.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags= merge(var.tags,var.public_subet_tags, {Name= var.public_subet_Names[count.index]})
}
