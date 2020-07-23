locals {
	filename = "../../lambda/lambda.zip"
}

resource "aws_lambda_function" "extract_process" {
  filename      = "${local.filename}"
  function_name = "extract_process"
  role          = "${var.role_arn}"
  handler       = "main"
  runtime       = "go1.x"
  timeout       = "${var.timeout}"
  memory_size   = "${var.memory_size}"
  reserved_concurrent_executions = 1
  source_code_hash = "${filebase64sha256(local.filename)}"

  tags = "${var.tags}"
}
