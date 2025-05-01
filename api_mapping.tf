# Create the API mapping (if provided)
resource "aws_apigatewayv2_api_mapping" "http_api_mapping" {
  count = var.domain_name != null ? 1 : 0

  api_id          = aws_apigatewayv2_api.http_api.id
  domain_name     = var.domain_name
  stage           = aws_apigatewayv2_stage.http_api_stage.name
  api_mapping_key = var.api_mapping_key
}

# Outputs
output "api_id" {
  description = "The ID of the HTTP API"
  value       = aws_apigatewayv2_api.http_api.id
}

output "api_endpoint" {
  description = "The endpoint of the HTTP API"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}

output "stage_name" {
  description = "The name of the stage"
  value       = aws_apigatewayv2_stage.http_api_stage.name
}
