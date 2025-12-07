variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "tags" {
    type = map
    default = {
        terraform = "true"
        environment = "Dev"
        Name = "timing"
    }
}

variable "azs" {
  type = list 
    default = ["ap-south-2a", "ap-south-2b"]
}

variable "public_subnet_cidr" {
  type = list 
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subet_Names" {
  type = list 
  default = ["timing-public-2a", "timing-public-2b"]
}

variable "private_subnet_cidr" {
  type = list 
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "private_subet_Names" {
  type = list 
  default = ["timing-private-2a", "timing-private-2b"]
}

variable "database_subnet_cidr" {
  type = list 
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "database_subet_Names" {
  type = list 
  default = ["timing-database-2a", "timing-database-2b"]
}

variable "rds_security_group_name" {
  type = string 
  default = "timing"
}

variable "rds_security_group_description" {
  type = string
  default = "This security group is to attach timing RDS"
}

variable "ingress_with_cidr" {
  default = []
}

variable "allocated_storage" {
  default = "10"
}

variable "db_name" {
  default = "timing"
}

variable "db_identifier" {
  default = "timing"
}

variable "engine" {
  default = "postgres"
}

variable "engine_version" {
  default = "17.6-R2"
}

variable "instance_class" {
  default = "db.t4g.micro"
}

variable "rds_username" {
  default = "timingadmin"
}

variable "secret_name" {
  default = "timing/rds-password-value"
}