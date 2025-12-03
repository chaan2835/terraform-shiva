data "aws_ami" "ami_info" {
  most_recent = true
  owners = [var.aws_accounts[data.aws_region.current.region]] # Amazon

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-kernel-6.1-x86_64"]
  }

   filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  
}

# to fetch the current region
data "aws_region" "current" {}