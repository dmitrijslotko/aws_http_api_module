# Create the route
resource "aws_apigatewayv2_route" "http_api_route" {
  api_id               = aws_apigatewayv2_api.http_api.id
  route_key            = var.route_key
  target               = var.integration_target
  api_key_required     = var.api_key_required
  authorization_type   = var.authorization_type
  authorizer_id        = var.authorizer_id != null ? (var.authorizer_name != null ? aws_apigatewayv2_authorizer.http_api_authorizer[0].id : var.authorizer_id) : null
  authorization_scopes = var.authorization_scopes
  operation_name       = var.operation_name
}
