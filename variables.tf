# tflint-ignore: terraform_unused_declarations
variable "chart_version" {
  description = "The helm chart version to use"
  type        = string
  default     = "19.0.1"
}

variable "loki_chart_version" {
  description = "The loki helm chart version to use"
  type        = string
  default     = "0.79.4"
}

variable "promtail_chart_version" {
  description = "The promtail helm chart version to use"
  type        = string
  default     = "6.16.6"
}

variable "values_yaml_body" {
  description = "The yaml file content to use with helm chart"
  type        = string
  default     = ""
}

variable "s3_bucket_data" {
  description = "The data of the S3 bucket to store loki logs"
  type =object({
    aws_access_key_id     = string
    aws_secret_access_key = string
    name_of_bucket        = string
    region                = string
  })
}

