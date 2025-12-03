output "ip_address" {
  value = aws_instance.sample-instance-1.public_ip
}

output "ami_id" {
  value = data.aws_ami.ami_info.image_id
  
} 

# To print the current region
output "current_region" {
  value = data.aws_region.current.region
}

output "vpc_info" {
  value = data.aws_vpc.existing_vpc
  
}