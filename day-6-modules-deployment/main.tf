module "vpc" {
    source = "../terraform-modules/vpc"
    tags = var.tags
    igw_tags = var.igw_tags
    public_subnet_tags = var.public_subnet_tags
    private_subnet_tags = var.private_subnet_tags
    public_route_table_tags = var.public_route_table_tags
    nat_tags = var.nat_tags
    private_route_table_tags = var.private_route_table_tags
    DB_subnet_tags = var.DB_subnet_tags
}

# As a user we are creating security group in the VPC module created above

resource "aws_security_group" "web" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "timing-web"
  }
}