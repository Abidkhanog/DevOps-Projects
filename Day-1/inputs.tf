variable "aws_region" {
  type = string
  default = "us-west-2"
  description = "Set up our region , that we want to use"
}

variable "project_name" {
  type = string
  description = "project name"
}

variable "bundle_id" {
  type = string
  default = "nano_2_0"
  description = "instance size"
}

variable "lightsail_blueprints" {
  type = map(string)
  description = "The id for virtual private server image "
}
  
