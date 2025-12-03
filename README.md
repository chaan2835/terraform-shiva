# terraform-shiva
this is the terraform course by shiva

# download the terraform binary file 
https://developer.hashicorp.com/terraform/install

# set the path for the terraform in env vars
C:\Users\chand\Downloads\dimpu\devops-practise\terraform-shiva\softwares

# install the aws cli 
https://awscli.amazonaws.com/AWSCLIV2.msi

# create one user in aws for using the terraform 
give the user permissions as admin bcz we need to create the infra 

# configrue the aws
aws congigure
AWS Access Key ID [****************F5XB]: AKIA3Gxxxxxxxxxxxxxxxx 
AWS Secret Access Key [****************4Umz]: 27Vc7wZYTxxxxxxxxxxxxxxxxxxxxxxxxx
Default region name [us-east-1]: ap-south-2
Default output format [None]:


Terraform is popular IaC (Infrastructure as a Code) tool. It is best in the market now.

# Version Control:

Since it is code, we can maintain in Git to version control. We can completely maintain the history of infra and collaboration is easy.

# Consistent Infra:

Often we face the problem of different configurations in different environments like DEV, QA, PROD, etc. Using terraform we can create similar infra in multiple environments with more reliability.

# Automated Infra CRUD:

Using terraform we can create entire infra in minutes reducing the human errors. Updating infra using terraform is also easy. Using Terraform we can delete infra.

# Inventory Management:

If we create infra manually it is very tough to maintain the inventory of resources in diff region. But by seeing terraform you can easily tell the resources you are using in different regions.

# Cost Optimisation:

When you need infra you can create in minutes. When you don't you can delete in minutes, so you can save the cost.

# Automatic dependency management:

terraform can understand the dependency of resources. It can tell us the dependency clearly.

# Modular Infra:
Code reuse. We can develop our own modules our use open source modules to reuse the infra code. instead of spending more time to create infra from the scratch we can reuse modules.

# Terraform Commands
First command is to initialize the terraform, at this stage terraform downloads the provider into .terraform folder.
1) terraform init 

Next we need to run plan command, at this stage terraform compares the infra between declared and existing. This is only plan terraform will not create
2) terraform plan

3) Next we need to apply the infra, at this stage terraform create the infra with approval.
terraform apply