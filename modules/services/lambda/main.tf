################### CONSULTAR ##########################
data "template_file" "consultar" {  
  template = "${file("${path.module}/scripts/consultar.py")}"
  vars = {
    aws_region = var.aws_region
    dynamodb-table-name = var.dynamodb-table-name
  }
}
data "archive_file" "consultar" {
  type        = "zip"
  output_path = "${path.module}/${var.consultar_lambda}.zip"
  source {
    content  = "${data.template_file.consultar.rendered}"
    filename = "lambda_function.py"
  }  
}

################### CREAR ##########################
data "template_file" "crear" {  
  template = "${file("${path.module}/scripts/crear.py")}"
  vars = {
    aws_region = var.aws_region
    dynamodb-table-name = var.dynamodb-table-name
  }
}
data "archive_file" "crear" {
  type        = "zip"
  output_path = "${path.module}/${var.crear_lambda}.zip"
  source {
    content  = "${data.template_file.crear.rendered}"
    filename = "lambda_function.py"
  }  
}


################### ELIMINAR ##########################
data "template_file" "eliminar" {  
  template = "${file("${path.module}/scripts/eliminar.py")}"
  vars = {
    aws_region = var.aws_region
    dynamodb-table-name = var.dynamodb-table-name
  }
}
data "archive_file" "eliminar" {
  type        = "zip"
  output_path = "${path.module}/${var.eliminar_lambda}.zip"
  source {
    content  = "${data.template_file.eliminar.rendered}"
    filename = "lambda_function.py"
  }  
}

################### ACTUALIZAR ##########################
data "template_file" "actualizar" {  
  template = "${file("${path.module}/scripts/actualizar.py")}"
  vars = {
    aws_region = var.aws_region
    dynamodb-table-name = var.dynamodb-table-name
  }
}
data "archive_file" "actualizar" {
  type        = "zip"
  output_path = "${path.module}/${var.actualizar_lambda}.zip"
  source {
    content  = "${data.template_file.crear.rendered}"
    filename = "lambda_function.py"
  }  
}


####################### RESOURCES ##################



resource "aws_lambda_function" "consultar" {
  filename      = "${path.module}/${var.consultar_lambda}.zip"
  function_name = var.consultar_lambda
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python2.7"
}

resource "aws_lambda_function" "crear" {
  filename      = "${path.module}/${var.crear_lambda}.zip"
  function_name = var.crear_lambda
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python2.7"
}

resource "aws_lambda_function" "eliminar" {
  filename      = "${path.module}/${var.eliminar_lambda}.zip"
  function_name = var.eliminar_lambda
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python2.7"
}

resource "aws_lambda_function" "actualizar" {
  filename      = "${path.module}/${var.actualizar_lambda}.zip"
  function_name = var.actualizar_lambda
  role          = var.role_arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python2.7"
}
