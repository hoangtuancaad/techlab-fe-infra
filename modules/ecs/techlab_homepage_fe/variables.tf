variable "environment_name" {
  description = "The name of the environment"
  type        = string
}

variable "ecr_uri" {
  type        = string
  description = "ECR uri for image in ECS task definition"
}

variable "logs_region" {
  type        = string
  description = "The regions of the environment"
}

# Service
variable "public_subnet_id" {
  type        = string
  description = "The public subnet id"
}

variable "security_group_ecs_task_service" {
  type        = string
  description = "The security group for the ECS task"
}

# IAM
variable "ecs_task_execution_role_arn" {
  type        = string
  description = "The ARN of the ECS task execution role"
}

variable "ecs_task_container_role_arn" {
  type        = string
  description = "The ARN of the ECS task container role"
}

# Secrets
variable "secret_arn" {
  type        = string
  description = "The ARN of the secret"
}

# Load Balancer
variable "target_group_arn" {
  type        = string
  description = "The ARN of the target group"

}
