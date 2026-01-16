variable "region" {
  default = "ap-south-1"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "Admin12345!"
}
variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

