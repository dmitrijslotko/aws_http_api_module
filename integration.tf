resource "aws_apigatewayv2_integration" "integrations" {
  for_each               = var.endpoints
  api_id                 = aws_apigatewayv2_api.api.id
  integration_type       = each.value.integration_type
  integration_uri        = each.value.integration_uri
  connection_type        = each.value.connection_type
  integration_method     = each.value.integration_method
  passthrough_behavior   = each.value.passthrough_behavior
  payload_format_version = "2.0"
}

