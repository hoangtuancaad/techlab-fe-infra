variable "environment_name" {
  type        = string
  description = "This is environment name [prod | dev | poc]"
}

# policy limit
variable "secert_arn" {
  type        = string
  description = "secret_arn"
}
variable "ecr_arn" {
  type        = string
  description = "ecr_arn"
}
