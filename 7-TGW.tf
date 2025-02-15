# 4. Build the Transit Gateway

resource "aws_ec2_transit_gateway" "NewYork-TGW01" {
  description = "NewYork-TGW01"

  tags = {
    Name     = "NewYork-TGW01"
    Service  = "TGW"
    Location = "Sao Paulo"
    Owner    = "TIQS"
  }
}