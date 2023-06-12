
data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnet1" {

  availability_zone = data.aws_availability_zones.available.names[0]

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 0)
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_subnet" "public_subnet2" {

  availability_zone = data.aws_availability_zones.available.names[1]

  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 64)
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_subnet" "private_subnet1" {
  availability_zone = data.aws_availability_zones.available.names[0]
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 128)
  vpc_id            = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}

resource "aws_subnet" "private_subnet2" {
  availability_zone = data.aws_availability_zones.available.names[1]
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, 192)
  vpc_id            = aws_vpc.vpc.id

  tags = {
    Name = var.app_name
  }
}