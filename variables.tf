variable "aws_region" {
  default = "us-east-1"
  type = string
  description = "Default AWS region variable"  
}

variable "image_id" {
  default = "ami-09e67e426f25ce0d7"
  type = string
  description = "us-east-1 Ubuntu 20 LTS image id"
}