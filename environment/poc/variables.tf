variable "profile" {
  description = "The AWS profile to use"
  type        = string
}

variable "region" {
  description = "The region in which the resources will be created"
  type        = string
}

variable "environment_name" {
  description = "The name of the environment. This will be used to create the secret name."
  type        = string
}

