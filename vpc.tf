
provider "aws" {
  version = "~> 2.0"
  region     = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
}


#######################################
############## RESOURCES ##############
#######################################

resource "aws_vpc" "terraformvpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "rafa-vpc"
  }
}

resource "aws_dynamodb_table" "paisestable" {
  name           = "paises-table"  
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "pais"
  range_key      = "capital"


  attribute {
    name = "pais"
    type = "S"
  }

  attribute {
    name = "capital"
    type = "S"
  }

  tags = {
    Name        = "paises-table"
    Environment = "production"
  }
}

