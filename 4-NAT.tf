resource "aws_eip" "NewYork-ElasticIP" {
  # vpc = true

  tags = {
    Name = "NewYork-ElasticIP"
  }
}

resource "aws_nat_gateway" "NewYork-Nat-GW" {
  allocation_id = aws_eip.NewYork-ElasticIP.id
  subnet_id     = aws_subnet.vpc-A-public-us-east-1a.id

  tags = {
    Name = "NewYork-Nat-GW"
  }
}