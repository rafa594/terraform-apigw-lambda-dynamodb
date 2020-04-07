output "dynamodb_table_arns" {
  value = ["${aws_dynamodb_table.table.*.arn}"]
}

output "dynamodb_table_stream_arns" {
  value = ["${aws_dynamodb_table.table.*.stream_arn}"]
}
output "dynamodb_table_names" {
  value = ["${aws_dynamodb_table.table.*.name}"]
}