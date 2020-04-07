variable "aws_region" {
    default = "us-west-2"
}
variable "dynamodb-table-name"{
    default = "rafa-paises"
}
variable "consultar_lambda"{
    default = "consultar-pais"
}
variable "crear_lambda"{
    default = "registrar-pais"
}

variable "eliminar_lambda"{
    default = "eliminar-pais"
}
variable "actualizar_lambda"{
    default = "actualizar-pais"
}

variable "lambda_name" {
  default = "lambda-rafa"
}
