# 8. Create EC2 Instances

resource "aws_instance" "VPC-A-NewYork-Prod-Windows" {
  ami                    = "ami-0c614dee691cbbf37"
  instance_type          = "t2.medium"
  subnet_id              = aws_subnet.vpc-A-public-us-east-1a.id
  vpc_security_group_ids = [aws_security_group.VPC-A-NewYork-Prod-With-Bastion-01.id]

  tags = {
    Name    = "VPC-A-NewYork-Prod-Windows"
    service = "windows"
  }
}

resource "aws_instance" "VPC-B-NewYork-Dev-basiclinux" {
  ami                    = "ami-0c614dee691cbbf37"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.vpc-A-public-us-east-1a.id
  vpc_security_group_ids = [aws_security_group.VPC-A-NewYork-Prod-With-Bastion-01.id]

  tags = {
    Name    = "VPC-B-NewYork-Dev-basiclinux"
    service = "basiclinux"
  }
}