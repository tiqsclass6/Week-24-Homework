terraform {
  backend "s3" {
    bucket  = "tiqs-tf-state-files"     # Name of the S3 bucket
    key     = "week-24-homework.tfstate" # The name of the state file in the bucket
    region  = "us-east-1"               # Choose your region
    encrypt = true                      # Enable server-side encryption (optional but recommended)
  }
}
