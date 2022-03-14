resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_emr.py"
  source = "../job_emr.py"
  etag   = filemd5("../job_emr.py")
}