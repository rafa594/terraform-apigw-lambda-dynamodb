resource "aws_dynamodb_table" "table" {
  name           = var.dynamodb-table-name
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
    Name        = var.dynamodb-table-name
    Environment = "production"
  }
}