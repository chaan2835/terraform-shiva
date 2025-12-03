resource "aws_vpc" "timed-automated-vpc" {
  cidr_block       = "${var.cidr_block}"
  instance_tenancy = "default"

  tags = merge(
    {
      Name = "timed-automated-vpc"
    },
    var.tags
  ) 
}

resource "aws_subnet" "automated-public-subnet" {
  vpc_id     = aws_vpc.timed-automated-vpc.id
  cidr_block = "${var.public_subnet_cidr}"

  tags = merge(
    {
      Name = "timed-automated-public-subnet"
    },
    var.tags
  )
}

resource "aws_subnet" "automated-private-subnet" {
  vpc_id     = aws_vpc.timed-automated-vpc.id
  cidr_block = "${var.private_subnet_cidr}"

  tags = merge(
    {
      Name = "timed-automated-private-subnet"
    },
    var.tags
  )
}

resource "aws_internet_gateway" "automated-timed-igw" {
  vpc_id = aws_vpc.timed-automated-vpc.id

  tags = merge(
    {
      Name = "automated-timed-igw"
    },
    var.tags
  )
}

resource "aws_route_table" "automated-timed-public-rt" {
  vpc_id = aws_vpc.timed-automated-vpc.id

  route {
    cidr_block = "${var.route_table_cidr_block}"
    gateway_id = aws_internet_gateway.automated-timed-igw.id
  }

  tags = merge(
    {
      Name = "automated-timed-public-rt"
    },
    var.tags
  )
}

resource "aws_eip" "automated-timed-eip" {
    tags = merge(
      {
        Name = "automated-timed-eip"
      },
      var.tags
    )
}

resource "aws_nat_gateway" "automated-timed-nat-gw" {
  allocation_id = aws_eip.automated-timed-eip.id
  subnet_id     = aws_subnet.automated-public-subnet.id 

  tags = merge(
    {
      Name = "automated-timed-nat-gw"
    },
    var.tags
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.automated-timed-igw]
}

resource "aws_route_table" "automated-timed-private-rt" { # for private route we need nat gateway
  vpc_id = aws_vpc.timed-automated-vpc.id
   route {
        cidr_block     = "${var.route_table_cidr_block}"
        nat_gateway_id = aws_nat_gateway.automated-timed-nat-gw.id
    }
  tags = merge(
    {
      Name = "automated-timed-private-rt"
    },
    var.tags
  )
}

# Associate public subnet to public route table
resource "aws_route_table_association" "automated-public-association" {
  subnet_id      = aws_subnet.automated-public-subnet.id
  route_table_id = aws_route_table.automated-timed-public-rt.id
}

# Associate private subnet to private route table
resource "aws_route_table_association" "automated-private-association" {
  subnet_id      = aws_subnet.automated-private-subnet.id
  route_table_id = aws_route_table.automated-timed-private-rt.id
}
