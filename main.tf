
provider "aws" {
  version = "~> 2.0"
  region     = var.aws_region
  shared_credentials_file = "~/.aws/credentials"
}


module "lambda" {
  source = "./modules/services/lambda"
  aws_region = var.aws_region
  dynamodb-table-name = var.dynamodb-table-name
  role_arn = "${module.iam.lambda_role_arn}"
  crear_lambda = var.crear_lambda
  consultar_lambda = var.consultar_lambda
  eliminar_lambda = var.eliminar_lambda
  actualizar_lambda = var.actualizar_lambda
}

module "dynamodb" {
  source = "./modules/services/dynamodb"
  dynamodb-table-name = var.dynamodb-table-name 
}


module "iam" {
  source = "./modules/iam"  
  lambda_name = var.lambda_name
}


