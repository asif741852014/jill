resource "aws_vpc" "asif_vpc" {
    cidr_block = var.vpccidr
    tags = {
      Name = "asif_vpc"
    }
}

resource "aws_internet_gateway" "asifigw" {
  vpc_id = aws_vpc.asif_vpc.id
  tags = {
    Name = "asifigw"
  }
}


data "aws_availability_zones" "az" {}

resource "aws_subnet" "asif_subnet1" {
  vpc_id = aws_vpc.asif_vpc.id
  cidr_block = var.subnetcidr1
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.az.names[0]
  tags = {
    Name = "asifsubnet1"
  }
}

resource "aws_subnet" "asif_subnet2" {
  vpc_id = aws_vpc.asif_vpc.id
  cidr_block = var.subnetcidr2
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.az.names[1]
  tags = {
    Name = "asifsubnet2"
  }
}


resource "aws_route_table" "asifroutetable" {
   vpc_id = aws_vpc.asif_vpc.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.asifigw.id
   }
   tags ={
    Name = "asifrt"
   }
}


resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.asif_subnet1.id
    route_table_id = aws_route_table.asifroutetable.id
  
}

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.asif_subnet2.id
    route_table_id = aws_route_table.asifroutetable.id
  
}