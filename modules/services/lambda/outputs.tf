output "crear_arn" {
  value = aws_lambda_function.crear.invoke_arn
}

output "consultar_arn" {
  value = aws_lambda_function.consultar.arn
}

output "eliminar_arn" {
  value = aws_lambda_function.eliminar.arn
}

output "actualizar_arn" {
  value = aws_lambda_function.actualizar.arn
}


