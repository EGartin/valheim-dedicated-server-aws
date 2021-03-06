/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

data "aws_region" "current" {
}
data "aws_availability_zones" "azs" {
    
}
#RANGE 10.10.x.x VPC NETWORK
resource "aws_vpc" "valheim-vpc"{
  cidr_block = "10.10.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  tags = {
      Name = "Valheim VPC Class B"
  }
}
#IGW
resource "aws_internet_gateway" "gw"{
  vpc_id = aws_vpc.valheim-vpc.id
}
#ROUTE TABLE EDITS
resource "aws_default_route_table" "r"{
  default_route_table_id = aws_vpc.valheim-vpc.default_route_table_id
}

resource "aws_route" "igw-route"{
  route_table_id = aws_vpc.valheim-vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id
  depends_on = [aws_internet_gateway.gw]
}

#10 Subnet
resource "aws_subnet" "valheim-subnets-10"{
  count =  length(data.aws_availability_zones.azs.names)
  availability_zone = element(data.aws_availability_zones.azs.names,count.index)
  vpc_id = aws_vpc.valheim-vpc.id
  cidr_block = element(var.valheim-subnet-10,count.index)
  
  depends_on = [aws_internet_gateway.gw]

  tags = {
    Name = "Valheim Class C 1${count.index} Subnet"
  }
}