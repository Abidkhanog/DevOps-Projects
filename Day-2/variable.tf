variable "aws_region" {
  description = "Region Name"
  type = string
  default = "eu-west-1"
}
variable "config_bucket_name" {
  description = "S3 bucket name"
  type = string
  default = "abid-aws-config-logs-1-eu-west-1"
}

