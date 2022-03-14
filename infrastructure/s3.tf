resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  #acl    = "private"


  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}
