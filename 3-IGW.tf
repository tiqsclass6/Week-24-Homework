resource "aws_internet_gateway" "ASG01_igw" {
  vpc_id = aws_vpc.ASG01-vpc.id
  tags = {
    Name    = "ASG01_igw"
    Service = "IGW"
  }
}