
variable "main_config" {
  description = "Main configuration for the API"
  type = object({
    name                         = string
    type                         = string
    disable_execute_api_endpoint = optional(bool, false)
    stage_name                   = optional(string, "dev")
    auto_deploy                  = optional(bool, true)
  })
  validation {
    condition     = contains(["HTTP", "WEBSOCKET"], var.main_config.type)
    error_message = "API type must be either 'HTTP' or 'WEBSOCKET'."
  }
}


variable "endpoints" {
  type = map(object({
    path                 = string
    method               = string
    version              = optional(string, "v1")
    authorizer           = optional(string)
    integration_type     = optional(string, "AWS_PROXY")
    integration_uri      = string
    connection_type      = optional(string, "INTERNET")
    integration_method   = optional(string, "POST")
    passthrough_behavior = optional(string, "WHEN_NO_MATCH")
  }))
}



