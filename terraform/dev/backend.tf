terraform {
  backend "s3" {
    bucket  = "dev.terraform.caseli.com.br"
    key     = "guilherme-terraform/terraform.tfstate"
    region  = "sa-east-1" 
    profile = "gui"
  }
}
