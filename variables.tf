# tflint-ignore: terraform_unused_declarations
variable "chart_version" {
  description = "The helm chart version to use"
  type        = string
  default     = "19.0.1"
}

