terraform {
  backend "s3" {
    bucket  = "your-bucket-name"     # Name of the S3 bucket
    key     = "dateortime.tfstate" # The name of the state file in the bucket
    region  = "us-east-1"               # Choose your region
    encrypt = true                      # Enable server-side encryption (optional but recommended)
  }
}
