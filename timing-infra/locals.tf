locals {
  public_route_table_Name = format("%s-%s",lookup(var.tags,"Name"),"public")
  private_route_table_Name = format("%s-%s",lookup(var.tags,"Name"),"private")
  database_route_table_Name = format("%s-%s",lookup(var.tags,"Name"),"database")    

  vpc_id = module.vpc.vpc_id
  rds_security_group_id = module.security_group.security_group_id
}