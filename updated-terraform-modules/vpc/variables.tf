variable "vpc_cidr" {
  type = string
}

variable "tags" {
  type = map 
}

variable "vpc_tags" {
  type = map 
  default = {}
}

variable "azs" {
  type = list
}

variable "public_subnet_cidr" {
  type = list 
}

variable "public_subet_tags" {
  type = map 
  default = {}
}

variable "public_subet_Names" {
  type = list
}

variable "igw_tags" {
 type = map 
 default = {} 
}

variable "public_route_table_tags" {
  type = map
  default = {}
}

variable "public_route_table_Name" {
  
}

variable "private_subnet_cidr" {
  type = list 
}

variable "private_subet_tags" {
  type = map 
  default = {}
}
 
variable "private_subet_Names" {
  type = list 
}

variable "private_route_table_tags" {
  type = map 
  default = {}
}

variable "private_route_table_Name" {
  
}

variable "database_subnet_cidr" {
  type = list 
}

variable "database_subet_tags" {
  type = map
  default = {}
}

variable "database_subet_Names" {
  
}

variable "database_route_table_tags" {
  type = map 
  default = {}
}

variable "database_route_table_Name" {
  
}

variable "database_subnet_group_tags" {
  type = map 
  default = {}
}