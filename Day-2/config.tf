resource "aws_config_configuration_recorder" "config_recorder" {
  name     = "aws-config-recorder"
  role_arn = aws_iam_role.aws_config_role.arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

resource "aws_config_delivery_channel" "config_channel" {
  name           = "aws-config-delivery-channel"
  s3_bucket_name = aws_s3_bucket.config_logs.bucket

  depends_on = [
    aws_config_configuration_recorder.config_recorder
  ]
}

resource "aws_config_configuration_recorder_status" "config_status" {
  name       = aws_config_configuration_recorder.config_recorder.name
  is_enabled = true

  depends_on = [
    aws_config_delivery_channel.config_channel
  ]
}

