# crete a s3 bucket
resource "aws_s3_bucket" "my_archival_bucket" {
  bucket = "my-archival-bucket-abid-glacier"
}

