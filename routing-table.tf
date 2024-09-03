resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.prd-vpc.id
  route {
    cidr_block = var.CIDR_RT
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.NAME_RT
  }
}
