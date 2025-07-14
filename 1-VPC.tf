resource "aws_vpc" "ASG01-vpc" {
  cidr_block = "10.230.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "ASG01-vpc"
    Service = "VPC"
    Owner   = "TIQS"
  }
}