resource "aws_s3_bucket" "guilherme_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  force_destroy = true

  tags = "${var.tags}"
}

resource "aws_lambda_permission" "extract_from_s3_allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${var.function_name_extract_process}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${aws_s3_bucket.guilherme_bucket.arn}"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${aws_s3_bucket.guilherme_bucket.id}"

  lambda_function {
    lambda_function_arn = "${var.function_name_extract_process}"
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }
}