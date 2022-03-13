resource "aws_s3_bucket" "datalake" {
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  #acl    = "private"


  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_emr.py"
  source = "../job_emr.py"
  etag   = filemd5("../job_emr.py")
}

provider "aws" {
  region = "us-east-1"
}