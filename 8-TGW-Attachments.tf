# 5. Insert Transit Gateway (TGW) Attachments to the TGW

resource "aws_ec2_transit_gateway_vpc_attachment" "VPC-A-NewYork-Prod-TGW-Attachment" {
  subnet_ids         = [aws_subnet.vpc-A-public-us-east-1a.id]
  transit_gateway_id = aws_ec2_transit_gateway.NewYork-TGW01.id
  vpc_id             = aws_vpc.VPC-A-NewYork-Prod.id

  tags = {
    Name = "VPC-A-NewYork-Prod-TGW-Attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "VPC-B-NewYork-Dev-TGW-Attachment" {
  subnet_ids         = [aws_subnet.vpc-B-private-us-east-1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.NewYork-TGW01.id
  vpc_id             = aws_vpc.VPC-B-NewYork-Dev.id

  tags = {
    Name = "VPC-B-NewYork-Dev-TGW-Attachment"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "VPC-C-NewYork-Test-TGW-Attachment" {
  subnet_ids         = [aws_subnet.vpc-C-private-us-east-1c.id]
  transit_gateway_id = aws_ec2_transit_gateway.NewYork-TGW01.id
  vpc_id             = aws_vpc.VPC-C-NewYork-Test.id

  tags = {
    Name = "VPC-C-NewYork-Test-TGW-Attachment"
  }
}