resource "aws_s3_bucket" "guilherme_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
  force_destroy = true

  tags = "${var.tags}"
}
