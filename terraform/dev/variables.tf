
variable "project_name" {
  default = "kadabra-infra-aws"
}

variable "aws_region" {
  default = "sa-east-1"
}

variable "aws_profile" {
  default = "gui"
}

variable "bucket_name" {
  default = "gui-dev2"
}

variable "common_tags" {
  default = {
    "Project" = "Bucket"
    "Email"   = "gcaseli@gmail.com"
    
  }
}
