# Define the module's input variables
variable "name" {
  description = "The name of the HTTP API"
  type        = string
}

variable "description" {
  description = "Description of the HTTP API"
  type        = string
  default     = ""
}

variable "cors_allow_origins" {
  description = "List of allowed origins for CORS"
  type        = list(string)
  default     = ["*"]
}

variable "cors_allow_headers" {
  description = "List of allowed headers for CORS"
  type        = list(string)
  default     = ["*"]
}

variable "cors_allow_methods" {
  description = "List of allowed HTTP methods for CORS"
  type        = list(string)
  default     = ["GET", "POST", "PUT", "DELETE", "OPTIONS", "HEAD", "PATCH"]
}

variable "cors_allow_credentials" {
  description = "Whether to allow credentials for CORS"
  type        = bool
  default     = false
}

variable "cors_expose_headers" {
  description = "List of headers exposed to the client"
  type        = list(string)
  default     = []
}

variable "cors_max_age" {
  description = "The maximum age of the preflight request in seconds"
  type        = number
  default     = 300
}

variable "disable_execute_api_endpoint" {
  description = "Whether to disable the default execute API endpoint"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the HTTP API"
  type        = map(string)
  default     = {}
}

variable "authorizer_name" {
  description = "Name of the authorizer"
  type        = string
  default     = null
}

variable "authorizer_type" {
  description = "Type of the authorizer (REQUEST or JWT)"
  type        = string
  default     = "REQUEST"
  validation {
    condition     = contains(["REQUEST", "JWT"], var.authorizer_type)
    error_message = "Authorizer type must be either REQUEST or JWT."
  }
}

variable "authorizer_uri" {
  description = "The URI of the authorizer (e.g., Lambda function ARN)"
  type        = string
  default     = null
}

variable "identity_sources" {
  description = "Identity sources for the authorizer (e.g., headers, query strings)"
  type        = list(string)
  default     = null
}

variable "authorizer_credentials_arn" {
  description = "Credentials ARN for the authorizer (for REQUEST authorizers)"
  type        = string
  default     = null
}

variable "jwt_audience" {
  description = "List of JWT audiences"
  type        = list(string)
  default     = null
}

variable "jwt_issuer" {
  description = "The JWT issuer"
  type        = string
  default     = null
}

variable "authorizer_result_ttl_in_seconds" {
  description = "Time to live for cached authorizer results"
  type        = number
  default     = 300
}

variable "authorizer_payload_format_version" {
  description = "Payload format version for Lambda authorizers (1.0 or 2.0)"
  type        = string
  default     = "1.0"
}

variable "enable_simple_responses" {
  description = "Whether a Lambda authorizer returns a simple response (true/false)"
  type        = bool
  default     = null
}

variable "route_key" {
  description = "The route key (e.g., GET /path)"
  type        = string
}

variable "integration_target" {
  description = "The target for the route (e.g., integrations/my_integration)"
  type        = string
  default     = null
}

variable "api_key_required" {
  description = "Whether an API key is required for the route"
  type        = bool
  default     = false
}

variable "authorization_type" {
  description = "The authorization type for the route (NONE, JWT, CUSTOM, AWS_IAM)"
  type        = string
  default     = "NONE"
  validation {
    condition     = contains(["NONE", "JWT", "CUSTOM", "AWS_IAM"], var.authorization_type)
    error_message = "Authorization type must be one of NONE, JWT, CUSTOM, or AWS_IAM."
  }
}

variable "authorizer_id" {
  description = "The ID of the authorizer to associate with the route"
  type        = string
  default     = null
}

variable "authorization_scopes" {
  description = "Authorization scopes for JWT authorization"
  type        = list(string)
  default     = []
}

variable "operation_name" {
  description = "The operation name for the route"
  type        = string
  default     = null
}

variable "integration_type" {
  description = "The integration type (e.g., AWS_PROXY, HTTP_PROXY)"
  type        = string
  default     = "HTTP_PROXY"
}

variable "integration_uri" {
  description = "The URI of the integration (e.g., Lambda ARN, HTTP endpoint)"
  type        = string
}

variable "integration_method" {
  description = "The HTTP method for the integration"
  type        = string
  default     = "POST"
}

variable "connection_type" {
  description = "The type of network connection (INTERNET or VPC_LINK)"
  type        = string
  default     = "INTERNET"
  validation {
    condition     = contains(["INTERNET", "VPC_LINK"], var.connection_type)
    error_message = "Connection type must be either INTERNET or VPC_LINK."
  }
}

variable "connection_id" {
  description = "The ID of the VPC link (if connection_type is VPC_LINK)"
  type        = string
  default     = null
}

variable "credentials_arn" {
  description = "The ARN of the credentials for the integration"
  type        = string
  default     = null
}

variable "request_parameters" {
  description = "A map of request parameters"
  type        = map(string)
  default     = {}
}

variable "response_parameters" {
  description = "Mappings to transform the HTTP response from a backend integration"
  type        = map(any)
  default     = {}
}

variable "timeout_milliseconds" {
  description = "Custom timeout between 50 and 30,000 milliseconds"
  type        = number
  default     = 30000
}

variable "tls_server_name_to_verify" {
  description = "The server name to verify for TLS connections"
  type        = string
  default     = null
}

variable "integration_subtype" {
  description = "The integration subtype (e.g., for AWS_PROXY)"
  type        = string
  default     = null
}

variable "payload_format_version" {
  description = "The payload format version (1.0 or 2.0)"
  type        = string
  default     = "1.0"
}

variable "stage_name" {
  description = "The name of the stage"
  type        = string
  default     = "dev"
}

variable "auto_deploy" {
  description = "Whether to automatically deploy changes to the stage"
  type        = bool
  default     = true
}

variable "stage_description" {
  description = "Description of the stage"
  type        = string
  default     = ""
}

variable "access_log_destination_arn" {
  description = "The ARN of the CloudWatch Logs log group for access logs"
  type        = string
  default     = null
}

variable "access_log_format" {
  description = "The format of the access logs"
  type        = string
  default     = null
}

variable "default_route_throttle_burst_limit" {
  description = "The throttling burst limit for the default route"
  type        = number
  default     = null
}

variable "default_route_throttle_rate_limit" {
  description = "The throttling rate limit for the default route"
  type        = number
  default     = null
}

variable "route_stage_settings" {
  description = "Route-specific settings for the stage"
  type = list(object(
    {
      route_key              = string
      throttling_burst_limit = optional(number)
      throttling_rate_limit  = optional(number)
    }
  ))
  default = []
}

variable "stage_variables" {
  description = "A map of stage variables"
  type        = map(string)
  default     = {}
}

variable "domain_name" {
  description = "The custom domain name for the API"
  type        = string
  default     = null
}

variable "api_mapping_key" {
  description = "The API mapping key"
  type        = string
  default     = null
}









