resource "aws_security_group" "ASG01-TG01" {
  name        = "ASG01-TG01"
  description = "ASG01-TG01"
  vpc_id      = aws_vpc.ASG01-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name   = "ASG01-TG01"
    Source = "TargetGroup-SG01"
  }
}

resource "aws_security_group" "ASG01_LB01" {
  name        = "ASG01_LB01"
  description = "ASG01_LB01"
  vpc_id      = aws_vpc.ASG01-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name   = "ASG01-LB01"
    Source = "ASG01_LB01"
  }
}

resource "aws_security_group" "ASG01_TG02" {
  name        = "ASG01_TG02"
  description = "ASG01_TG02"
  vpc_id      = aws_vpc.ASG01-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name   = "ASG01-TG02"
    Source = "TargetGroup-SG02"
  }
}