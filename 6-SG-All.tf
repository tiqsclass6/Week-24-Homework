# 7. Create Security Groups to VPCs

resource "aws_security_group" "VPC-B-NewYork-Dev-SG02" {
  name        = "VPC-B-NewYork-Dev-SG02"
  description = "VPC-B-NewYork-Dev-SG02"
  vpc_id      = aws_vpc.VPC-B-NewYork-Dev.id

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "VPC-B-NewYork-Dev"
    service = "basiclinux"
  }
}

resource "aws_security_group" "VPC-A-NewYork-Prod-With-Bastion-01" {
  name        = "VPC-A-NewYork-Prod-With-Bastion-01"
  description = "VPC-A-NewYork-Prod-With-Bastion-01"
  vpc_id      = aws_vpc.VPC-A-NewYork-Prod.id

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "VPC-A-NewYork-Prod-With-Bastion-01"
    service = "basicwindows"
  }
}