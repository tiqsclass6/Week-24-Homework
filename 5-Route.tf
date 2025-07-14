# Public Route Table for us-east-1a
resource "aws_route_table" "public-route-table-1a" {
  vpc_id = aws_vpc.ASG01-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ASG01_igw.id
  }

  tags = {
    Name = "public-route-table-1a"
  }
}

resource "aws_route_table_association" "public-subnet-association-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public-route-table-1a.id
}

# Public Route Table for us-east-1b
resource "aws_route_table" "public-route-table-1b" {
  vpc_id = aws_vpc.ASG01-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ASG01_igw.id
  }

  tags = {
    Name = "public-route-table-1b"
  }
}

resource "aws_route_table_association" "public-subnet-association-1b" {
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.public-route-table-1b.id
}

# Public Route Table for us-east-1c
resource "aws_route_table" "public-route-table-1c" {
  vpc_id = aws_vpc.ASG01-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ASG01_igw.id
  }

  tags = {
    Name = "public-route-table-1c"
  }
}

resource "aws_route_table_association" "public-subnet-association-1c" {
  subnet_id      = aws_subnet.public-us-east-1c.id
  route_table_id = aws_route_table.public-route-table-1c.id
}

# Private Route Table for us-east-1a
resource "aws_route_table" "private-route-table-1a" {
  vpc_id = aws_vpc.ASG01-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.USVA-Nat-GW.id
  }

  tags = {
    Name = "private-route-table-1a"
  }
}

resource "aws_route_table_association" "private-subnet-association-1a" {
  subnet_id      = aws_subnet.private-us-east-1a.id
  route_table_id = aws_route_table.private-route-table-1a.id
}

# Private Route Table for us-east-1b
resource "aws_route_table" "private-route-table-1b" {
  vpc_id = aws_vpc.ASG01-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.USVA-Nat-GW.id
  }

  tags = {
    Name = "private-route-table-1b"
  }
}

resource "aws_route_table_association" "private-subnet-association-1b" {
  subnet_id      = aws_subnet.private-us-east-1b.id
  route_table_id = aws_route_table.private-route-table-1b.id
}

# Private Route Table for us-east-1c
resource "aws_route_table" "private-route-table-1c" {
  vpc_id = aws_vpc.ASG01-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.USVA-Nat-GW.id
  }

  tags = {
    Name = "private-route-table-1c"
  }
}

resource "aws_route_table_association" "private-subnet-association-1c" {
  subnet_id      = aws_subnet.private-us-east-1c.id
  route_table_id = aws_route_table.private-route-table-1c.id
}