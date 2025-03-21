output "vpcid" {
    value = aws_vpc.asif_vpc.id
  
}

output "subnet_1" {
  value = aws_subnet.asif_subnet1.id
}

output "subnet_2" {
  value = aws_subnet.asif_subnet2.id
}

output "igw" {
  value = aws_internet_gateway.asifigw.id
}