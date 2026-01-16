# Define licecycle policy

resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle_configuration" {
  bucket = aws_s3_bucket.my_archival_bucket.id  # Reference the s3 bucket resource
  
  rule {
    id = "move-to-glacier"
    filter {
      prefix = ""        #you can set yoyr prefix
      }
    # Transition rule
    transition {
      days = 30
      storage_class = "GLACIER"
       }

    #Expiration rule
    expiration {
      days = 90
      }

    #status
    status = "Enabled"
   }
}
