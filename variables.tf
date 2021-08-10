# https://intersight.com/an/settings/api-keys/
## Generate API key to obtain the API Key and PEM file

variable "api_key" {
    description = "API Key for Terraform Demo Account"
    type = string
    default = "6111718d7564612d302ef254/611178d37564612d302f3b18/611299e47564612d3082bb94"
}

variable "secretkey" {
    description = "Filename (PEM) that provides secret key for Terraform Demo Account"
    type = string
    default = "SecretKey.txt"
}

variable "endpoint" {
    description = "Intersight API endpoint"
    type = string
    default = "https://pva-intersight.dovetail.lan"
}

variable "organization" {
    type = string
    default = "611177f96972652d30e59ae1"
}

variable "mac_pool_moid" {
    type = string
    default = "611299a16962752d30554440"
}

variable "ip_pool_moid" {
    type = string
    default = "6112996d6962752d30554439"
}

