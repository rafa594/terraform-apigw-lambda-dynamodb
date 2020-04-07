output "api_url" {
  value = aws_api_gateway_deployment.registrar.invoke_url
}

output "api_gw_message_resource_id" {
  //Done due to Terraform inability to evaluate one side of assertion and stop there if valid
  value = "test"
}