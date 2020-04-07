
provider "aws" {
  version = "~> 2.0"
  region     = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
}


module "services" {
  source = "./modules/iam"  
  dynamodb-table-name = "rafa-paises"    
}

module "iam" {
  source = "./modules/services/dynamodb"  
  lambda_name = "rafa-lambda"    
}


