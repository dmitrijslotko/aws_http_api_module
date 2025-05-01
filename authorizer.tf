# Create the authorizer (if provided)
resource "aws_apigatewayv2_authorizer" "http_api_authorizer" {
  count = var.authorizer_name != null ? 1 : 0

  api_id           = aws_apigatewayv2_api.http_api.id
  name             = var.authorizer_name
  authorizer_type  = var.authorizer_type
  authorizer_uri   = var.authorizer_uri
  identity_sources = var.identity_sources

  authorizer_credentials_arn = var.authorizer_credentials_arn

  jwt_configuration {
    audience = var.jwt_audience
    issuer   = var.jwt_issuer
  }

  authorizer_result_ttl_in_seconds  = var.authorizer_result_ttl_in_seconds
  authorizer_payload_format_version = var.authorizer_payload_format_version
  enable_simple_responses           = var.enable_simple_responses
}
