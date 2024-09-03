resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prd-vpc.id
  tags = {
    Name = var.NAME_IGW
  }
}