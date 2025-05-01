# Create the HTTP API
resource "aws_apigatewayv2_api" "http_api" {
  name          = var.name
  protocol_type = "HTTP"
  description   = var.description

  cors_configuration {
    allow_origins     = var.cors_allow_origins
    allow_headers     = var.cors_allow_headers
    allow_methods     = var.cors_allow_methods
    allow_credentials = var.cors_allow_credentials
    expose_headers    = var.cors_expose_headers
    max_age           = var.cors_max_age
  }

  disable_execute_api_endpoint = var.disable_execute_api_endpoint
  tags                         = var.tags
}

