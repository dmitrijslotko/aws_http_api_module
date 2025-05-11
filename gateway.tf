resource "aws_apigatewayv2_api" "api" {
  name                         = var.main_config.name
  protocol_type                = var.main_config.type
  disable_execute_api_endpoint = var.main_config.disable_execute_api_endpoint
}

resource "aws_apigatewayv2_stage" "stage" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = var.main_config.stage_name
  auto_deploy = var.main_config.auto_deploy

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.log_group.arn
    format          = "$$context.requestId $context.identity.sourceIp $context.identity.caller $context.identity.user $context.requestTime $context.requestTimeEpoch $context.httpMethod $context.path $context.status $context.protocol $context.responseLength"
  }
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/http_api/${var.main_config.name}"
  retention_in_days = 7
}

output "api" {
  value = aws_apigatewayv2_api.api
}

output "stage" {
  value = aws_apigatewayv2_stage.stage
}
