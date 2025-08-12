resource "aws_apigatewayv2_route" "routes" {
  for_each  = var.endpoints
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "${each.value.method} /${each.value.version}/${each.value.path}"
  target    = "integrations/${aws_apigatewayv2_integration.integrations[each.key].id}"
}

output "routes" {
  value = aws_apigatewayv2_route.routes
}
