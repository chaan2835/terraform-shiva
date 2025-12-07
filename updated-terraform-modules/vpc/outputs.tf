output "vpc_id" {
  value = aws_vpc.this2.id
}

output "aws_db_subnet_group_name" {
  value = aws_db_subnet_group.database.name
}