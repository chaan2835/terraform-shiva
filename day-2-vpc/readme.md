This session is about creating VPC through Terraform. One should have basic knowledge of VPC.

Below is the dependency diagram for better understanding.

1) First we create VPC.
2) then create subnets
    1. public subnet 
    2. private subnet
3) create route tables
    1. public route table 
        i. need to create internet gateway
    2. private route table
        i. nat gateway needs to create for creating NAT we need to create Elastic Ip 1st 



