output "config_bucket_name" {
  value = aws_s3_bucket.config_logs.bucket
}

output "config_iam_role" {
  value = aws_iam_role.aws_config_role.name
}
