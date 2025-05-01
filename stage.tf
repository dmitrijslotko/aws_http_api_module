# Create the stage
resource "aws_apigatewayv2_stage" "http_api_stage" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = var.stage_name
  auto_deploy = var.auto_deploy
  description = var.stage_description

  access_log_settings {
    destination_arn = var.access_log_destination_arn
    format          = var.access_log_format
  }

  default_route_settings {
    throttling_burst_limit = var.default_route_throttle_burst_limit
    throttling_rate_limit  = var.default_route_throttle_rate_limit
  }
  # route_settings is not a valid attribute for aws_apigatewayv2_stage

  stage_variables = var.stage_variables
  tags            = var.tags
}
