# 3. Build the Route Tables. One Public and Three Private

resource "aws_route_table" "VPC-A-NewYork-Prod-PublicRT" {
  vpc_id = aws_vpc.VPC-A-NewYork-Prod.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.NewYork-TGW01.id
  }

  tags = {
    Name = "VPC-A-NewYork-Prod-PublicRT"
  }
}

resource "aws_route_table" "VPC-A-NewYork-Prod-PrivateRT" {
  vpc_id = aws_vpc.VPC-A-NewYork-Prod.id

  tags = {
    Name = "VPC-A-NewYork-Prod-PrivateRT"
  }
}

resource "aws_route_table" "VPC-B-NewYork-Dev-PrivateRT" {
  vpc_id = aws_vpc.VPC-B-NewYork-Dev.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.NewYork-TGW01.id
  }

  tags = {
    Name = "VPC-B-NewYork-Dev-PrivateRT"
  }
}

resource "aws_route_table" "VPC-C-NewYork-Test-PrivateRT" {
  vpc_id = aws_vpc.VPC-C-NewYork-Test.id

  route {
    cidr_block         = "10.0.0.0/8"
    transit_gateway_id = aws_ec2_transit_gateway.NewYork-TGW01.id
  }

  tags = {
    Name = "VPC-C-NewYork-Test-PrivateRT"
  }
}