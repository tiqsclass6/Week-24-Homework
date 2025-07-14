resource "aws_eip" "USVA-ElasticIP" {
  tags = {
    Name = "USVA-ElasticIP"
  }
}

resource "aws_nat_gateway" "USVA-Nat-GW" {
  allocation_id = aws_eip.USVA-ElasticIP.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Name = "USVA-Nat-GW"
  }

  depends_on = [aws_internet_gateway.ASG01_igw]
}
