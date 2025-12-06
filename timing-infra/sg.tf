module "security_group" {
  source = "../updated-terraform-modules/security-group"
  vpc_id = local.vpc_id
  security_group_name = var.rds_security_group_name
  security_group_description = var.rds_security_group_description
  tags = var.tags
  ingress_with_cidr = var.ingress_with_cidr
}