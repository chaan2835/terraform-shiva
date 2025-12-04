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