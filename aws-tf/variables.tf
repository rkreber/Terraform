variable "project_name" {
  type        = string
  description = "Name of the Terraform project"
}

variable "role_arn" {
  type        = string
  description = "AWS Role to authenticate"
}

variable "region" {
  type        = string
  description = "Region where infrastucture is deployed"
}

variable "email_address" {
  type        = string
  description = "Email address for receiving notifications for Account activities"
}

variable "ec2_budget_limit" {
  type        = string
  description = "EC2 budget for monthly cost in dollars"
}

variable "pub_key" {
    type = string
    description = "Public key of the EC2 instance to SSH"
}