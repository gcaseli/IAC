module "extract_process_lambda" {
  source = "../modules/extract-process-lambda/"
  
  role_arn = "arn:aws:iam::956852603459:role/lambda_role"
  memory_size = 1024
  timeout = 900
  tags = "${var.common_tags}"
}

module "extract_bucket" {
  source = "../modules/extract-bucket/"
  
  bucket_name = "${var.bucket_name}"
  function_name_extract_process = "${module.extract_process_lambda.function_name}"
  tags = "${var.common_tags}"
}