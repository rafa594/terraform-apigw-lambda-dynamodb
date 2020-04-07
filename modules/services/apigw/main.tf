data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "registrar" {
  name = var.api_gw_name
  description = "API GW description."
  # endpoint_configuration {
  #   types = ["EDGE"]
  # }
}


resource "aws_api_gateway_resource" "proxy" {
   rest_api_id = aws_api_gateway_rest_api.registrar.id
   parent_id   = aws_api_gateway_rest_api.registrar.root_resource_id
   path_part   = "registrar"
}

resource "aws_api_gateway_method" "proxy" {
   rest_api_id   = aws_api_gateway_rest_api.registrar.id
   resource_id   = aws_api_gateway_resource.proxy.id
   http_method   = "ANY"
   authorization = "NONE"
 }



 resource "aws_api_gateway_integration" "registrar" {
   rest_api_id = aws_api_gateway_rest_api.registrar.id
   resource_id = aws_api_gateway_method.proxy.resource_id
   http_method = aws_api_gateway_method.proxy.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = var.crear_arn
 }

 resource "aws_api_gateway_method" "proxy_root" {
   rest_api_id   = aws_api_gateway_rest_api.registrar.id
   resource_id   = aws_api_gateway_rest_api.registrar.root_resource_id
   http_method   = "ANY"
   authorization = "NONE"
 }

 resource "aws_api_gateway_integration" "registrar_root" {
   rest_api_id = aws_api_gateway_rest_api.registrar.id
   resource_id = aws_api_gateway_method.proxy_root.resource_id
   http_method = aws_api_gateway_method.proxy_root.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = var.crear_arn
 }

resource "aws_api_gateway_deployment" "registrar" {
   depends_on = [
     aws_api_gateway_integration.registrar,
     aws_api_gateway_integration.registrar_root,
   ]

   rest_api_id = aws_api_gateway_rest_api.registrar.id
   stage_name  = "test"
 }

 resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = var.crear_lambda
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.registrar.execution_arn}/*/*"
 }

