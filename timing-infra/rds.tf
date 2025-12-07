module "RDS" {
    source = "../updated-terraform-modules/RDS"
    allocated_storage = var.allocated_storage
    db_name = var.db_name 
    db_identifier = var.db_identifier
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    username = var.rds_username
    db_subnet_group_name = local.db_subnet_group_name
    vpc_security_group_ids = [local.rds_security_group_id]
    secret_name = var.secret_name
    tags = var.tags
}