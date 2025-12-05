variable "cidr" {
    type = string
    default = "10.0.0.0/16"  
}

variable "public_subnet_cidr" {
    type = list
    #default = "10.3.2.0/24"  
}

variable "private_subnet_cidr" {
    type = list
    #default = "10.3.3.0/24"
}

variable "db_subnet_cidr" {
    type = list
    #default = "10.3.4.0/24"  
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map
  default = {
    Name        = "vpc"
  }
}

variable "igw_tags" {
  type = map 
    default = {
        Name = "igw"
    }
}

variable "public_subnet_tags" {
  type = map 
    default = {
        Name = "public-subnet"
    }
}

variable "private_subnet_tags" {
  type = map 
    default = {
        Name = "private-subnet"
    } 
}

variable "public_route_table_tags" {
  type = map 
    default = {
        Name = "public-route-table"
    }  
}

variable "nat_tags" {
  type = map 
    default = {
        Name = "nat-gateway"
    }
}

variable "private_route_table_tags" {
  type = map 
    default = {
        Name = "private-route-table"
    }
}

variable "DB_subnet_tags" {
  type = map 
    default = {
        Name = "db-subnet-group"
    }  
}