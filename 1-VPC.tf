# 1. Setup the three (3) Virtual Private Clouds (VPC)

resource "aws_vpc" "VPC-A-NewYork-Prod" {
  cidr_block = "10.230.0.0/16"

  tags = {
    Name     = "VPC-A-NewYork-Prod"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }
}

resource "aws_vpc" "VPC-B-NewYork-Dev" {
  cidr_block = "10.231.0.0/16"

  tags = {
    Name     = "VPC-B-NewYork-Dev"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }
}

resource "aws_vpc" "VPC-C-NewYork-Test" {
  cidr_block = "10.232.0.0/16"

  tags = {
    Name     = "VPC-C-NewYork-Test"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }
}