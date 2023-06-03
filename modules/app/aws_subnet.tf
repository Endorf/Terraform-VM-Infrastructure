
data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnet1" {

  availability_zone = data.aws_availability_zones.available.names[0]

  cidr_block = "10.0.0.0/24"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_subnet" "public_subnet2" {

  availability_zone = data.aws_availability_zones.available.names[1]

  cidr_block = "10.0.64.0/24"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_subnet" "private_subnet1" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block = "10.0.128.0/24"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_subnet" "private_subnet2" {
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block = "10.0.192.0/24"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}
