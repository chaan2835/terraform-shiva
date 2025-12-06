module "vpc" {
  source = "../updated-terraform-modules/vpc"
    vpc_cidr = var.vpc_cidr
    tags = var.tags
    azs = var.azs
    #public subnet variables
    public_subnet_cidr = var.public_subnet_cidr
    public_subet_Names = var.public_subet_Names
    public_route_table_Name = local.public_route_table_Name

    #private subnet variables
    private_subnet_cidr = var.private_subnet_cidr
    private_subet_Names = var.private_subet_Names
    private_route_table_Name = local.private_route_table_Name

    #database subnet variables
    database_subnet_cidr = var.database_subnet_cidr
    database_subet_Names = var.database_subet_Names
    database_route_table_Name = local.database_route_table_Name
}