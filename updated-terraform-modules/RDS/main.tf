resource "aws_db_instance" "main" {
    allocated_storage = var.allocated_storage
    db_name = var.db_name
    identifier = var.db_identifier
    engine = var.engine
    #engine_version_actual = var.engine_version
    instance_class = var.instance_class
    username = var.username
    db_subnet_group_name = var.db_subnet_group_name
    password = random_password.password.result
    vpc_security_group_ids = var.vpc_security_group_ids
    tags = merge(var.tags,var.rds_tags)
}

resource "random_password" "password" {
  length = 16
  special = true
  override_special = "!@#$%&*()-_=+[]{}<>?"
}

# store the password in aws secrets manager
resource "aws_secretsmanager_secret" "db_password_secret" {
  name = var.secret_name
  tags = merge(var.tags,var.rds_tags)
}

resource "aws_secretsmanager_secret_version" "db_password_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_password_secret.id
  secret_string = random_password.password.result
}