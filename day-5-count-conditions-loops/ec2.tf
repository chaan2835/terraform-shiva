# requirement is to create 3 ec2 instances using count named webserver,appserver,dbserver
# resource "aws_instance" "sample-instance" {
#   ami           = data.aws_ami.ami_info.image_id # ami id is diff for each region
#   instance_type = "t3.micro" # specify which type of instance
#   count = length(var.instances)

#   tags = {
#     Name = var.instances[count.index] # tag to identify the instance 
#   }
# }

# # using condition to create a test instance only if is_test is true
# resource "aws_instance" "test-instance" {
#   ami           = data.aws_ami.ami_info.image_id # ami id is diff for each region
#   instance_type = var.is_test ? "t3.micro" : "t3.large"

#   tags = {
#     Name = "test-instance" # tag to identify the instance 
#   }
# }

# creating multiple instances using for_each
# resource "aws_instance" "servers" {
#     for_each = var.servers
#     ami          = data.aws_ami.ami_info.image_id # ami id is diff for each region
#     instance_type = each.value
#     tags = {
#         Name = each.key # tag to identify the instance
#     }
# }

# creating instance using local values
resource "aws_instance" "local-instance" {
    ami = data.aws_ami.ami_info.image_id
    instance_type = "t3.micro"
    tags= {
        Name = local.instance_name
    }
}    