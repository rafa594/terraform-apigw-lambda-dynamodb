# Terraform API GW, Lambda & DynamoDB Deployment
This repository contains the configuration files to deploy a group of AWS Lambda functions (CRUD system) that consume an AWS DynamoDB instance.
These Lambda Functions are accessed through an AWS API Gateway resource.

# Project diagram:
![Terraform Lambda ApiGW DynamoDB Deployment](/images/diagram.png)

# Process
* First of all, Terraform must be installed. Check https://learn.hashicorp.com/terraform/getting-started/install.html to install it into your computer or Virtual Instance.
* Fill the main.tf and variables.tf files with your data.
* Run `terraform plan` to update the info of the modules.
* Run `terraform apply` to create all the resources specified in the Terraform files.
* Wait for the AWS resources creation and the API Gateway URL that is showed at the end of the Terraform apply command.