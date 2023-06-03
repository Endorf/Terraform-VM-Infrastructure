resource "aws_internet_gateway" "nat_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_route_table" "nat_gateway" {
  vpc_id = aws_vpc.vpc.id
  route {
    
    #TODO route to LB

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "nat_gateway1" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.nat_gateway.id
}

resource "aws_route_table_association" "nat_gateway2" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.nat_gateway.id
}

