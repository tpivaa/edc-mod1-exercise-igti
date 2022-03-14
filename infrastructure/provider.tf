provider "aws" {
  region = "sa-east-1"
}

# CENTRALIZAR O ARQUIVO DE CONTROLE DE ESTADO DO TERRAFORM
terraform {
  backend "s3" {
    bucket = "terraform-state-igti-tpiva"
    key = "state/igti/edc/mod1/terraform.tfstate"
    region = "sa-east-1"
  }
}