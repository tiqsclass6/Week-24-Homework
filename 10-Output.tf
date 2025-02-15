# VPC-A-Production
output "VPC-A-NewYork-Prod" {
  description = "VPC-A-Production"
  value       = aws_vpc.VPC-A-NewYork-Prod.id
}

# VPC-B-Development
output "VPC-B-NewYork-Dev" {
  description = "VPC-B-Development"
  value       = aws_vpc.VPC-B-NewYork-Dev.id
}

# VPC-C-Production
output "VPC-C-NewYork-Test" {
  description = "VPC-A-Test"
  value       = aws_vpc.VPC-C-NewYork-Test.id
}

# AWS-Subnet-vpc-A-public-us-east-1a
output "vpc-A-public-us-east-1a" {
  description = "vpc-A-public-us-east-1a"
  value       = aws_subnet.vpc-A-public-us-east-1a.id
}

# AWS-Subnet-vpc-A-private-us-east-1a
output "vpc-A-private-us-east-1a" {
  description = "vpc-A-private-us-east-1a"
  value       = aws_subnet.vpc-A-private-us-east-1a.id
}

# AWS-Subnet-vpc-B-private-us-east-1b
output "vpc-B-private-us-east-1b" {
  description = "vpc-B-private-us-east-1b"
  value       = aws_subnet.vpc-B-private-us-east-1b.id
}

# AWS-Subnet-vpc-C-private-us-east-1c
output "vpc-C-private-us-east-1c" {
  description = "vpc-C-private-us-east-1c"
  value       = aws_subnet.vpc-C-private-us-east-1c.id
}

# AWS-TransitGW-NewYork-TGW01
output "NewYork-TGW01" {
  description = "NewYork-TGW01"
  value       = aws_ec2_transit_gateway.NewYork-TGW01.id
}

# AWS-NewYork-Dev-SG02
output "aws_security_group-VPC-B-NewYork-Dev-SG02" {
  description = "VPC-B-NewYork-Dev-SG02"
  value       = aws_security_group.VPC-B-NewYork-Dev-SG02.id
}

# AWS-VPC-A-NewYork-Prod-With-Bastion-01
output "VPC-A-NewYork-Prod-With-Bastion-01" {
  description = "VPC-A-NewYork-Prod-With-Bastion-01"
  value       = aws_security_group.VPC-A-NewYork-Prod-With-Bastion-01.id
}