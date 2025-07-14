resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.ASG01-vpc.id
  cidr_block              = "10.230.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name     = "public-us-east-1a"
    Service  = "Subnet"
    Location = "N. Virginia"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "private-us-east-1a" {
  vpc_id                  = aws_vpc.ASG01-vpc.id
  cidr_block              = "10.230.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-us-east-1a"
    Service  = "Subnet"
    Location = "N. Virginia"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.ASG01-vpc.id
  cidr_block              = "10.230.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name     = "public-us-east-1b"
    Service  = "Subnet"
    Location = "N. Virginia"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id                  = aws_vpc.ASG01-vpc.id
  cidr_block              = "10.230.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-us-east-1b"
    Service  = "Subnet"
    Location = "N. Virginia"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "public-us-east-1c" {
  vpc_id                  = aws_vpc.ASG01-vpc.id
  cidr_block              = "10.230.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name     = "public-us-east-1c"
    Service  = "Subnet"
    Location = "N. Virginia"
    Owner    = "TIQS"
  }
}

resource "aws_subnet" "private-us-east-1c" {
  vpc_id                  = aws_vpc.ASG01-vpc.id
  cidr_block              = "10.230.13.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name     = "private-us-east-1c"
    Service  = "Subnet"
    Location = "N. Virginia"
    Owner    = "TIQS"
  }
}