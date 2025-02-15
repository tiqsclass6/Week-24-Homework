# 2. Setup the four (4) Subnets. One Public and Three Privates

resource "aws_subnet" "vpc-A-public-us-east-1a" {
  vpc_id                  = aws_vpc.VPC-A-NewYork-Prod.id
  cidr_block              = "10.230.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name     = "vpc-A-public-us-east-1a"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "vpc-A-private-us-east-1a" {
  vpc_id                  = aws_vpc.VPC-A-NewYork-Prod.id
  cidr_block              = "10.230.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "vpc-A-private-us-east-1a"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }

}

resource "aws_subnet" "vpc-B-private-us-east-1b" {
  vpc_id                  = aws_vpc.VPC-B-NewYork-Dev.id
  cidr_block              = "10.231.11.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name     = "vpc-B-private-us-east-1b"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "vpc-C-private-us-east-1c" {
  vpc_id                  = aws_vpc.VPC-C-NewYork-Test.id
  cidr_block              = "10.232.11.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "vpc-C-private-us-east-1c"
    Service  = "VPC"
    Location = "New York"
    Owner    = "TIQS"
  }
}