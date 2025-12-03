locals {
  instance_name = join("-", [var.instance_type, var.Environment])
}