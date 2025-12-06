locals {
  public_route_table_Name = format("%s-%s",lookup(var.tags,"Name"),"public")
  private_route_table_Name = format("%s-%s",lookup(var.tags,"Name"),"private")
  database_route_table_Name = format("%s-%s",lookup(var.tags,"Name"),"database")    
}