# Create the integration
resource "aws_apigatewayv2_integration" "http_api_integration" {
  api_id               = aws_apigatewayv2_api.http_api.id
  integration_type     = var.integration_type
  integration_uri      = var.integration_uri
  integration_method   = var.integration_method
  connection_type      = var.connection_type
  connection_id        = var.connection_id
  credentials_arn      = var.credentials_arn
  request_parameters   = var.request_parameters
  timeout_milliseconds = var.timeout_milliseconds

  tls_config {
    server_name_to_verify = var.tls_server_name_to_verify
  }
  integration_subtype    = var.integration_subtype
  payload_format_version = var.payload_format_version
}
