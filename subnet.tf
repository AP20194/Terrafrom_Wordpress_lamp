resource "aws_subnet" "subnet-public1" {
  cidr_block              = var.CIDR_SUB_PUB1
  vpc_id                  = aws_vpc.prd-vpc.id
  availability_zone       = var.AZ_SUB_PUB1
  map_public_ip_on_launch = true
  tags = {
    Name = var.NAME_SUB_PUB1
  }
}

resource "aws_subnet" "subnet-public2" {
  cidr_block              = var.CIDR_SUB_PUB2
  vpc_id                  = aws_vpc.prd-vpc.id
  availability_zone       = var.AZ_SUB_PUB2
  map_public_ip_on_launch = true
  tags = {
    Name = var.NAME_SUB_PUB2
  }
}

# resource "aws_subnet" "subnet-public3" {
#   cidr_block              = "10.1.3.0/24"
#   vpc_id                  = aws_vpc.prd-vpc.id
#   availability_zone       = "us-east-1c"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "wp-subnet-public3-1c"
#   }
# }

resource "aws_subnet" "subnet-private1" {
  cidr_block              = var.CIDR_SUB_PVT1
  vpc_id                  = aws_vpc.prd-vpc.id
  availability_zone       = var.AZ_SUB_PVT1
  map_public_ip_on_launch = false
  tags = {
    Name = var.NAME_SUB_PVT1
  }
}

resource "aws_subnet" "subnet-private2" {
  cidr_block              = var.CIDR_SUB_PVT2
  vpc_id                  = aws_vpc.prd-vpc.id
  availability_zone       = var.AZ_SUB_PVT2
  map_public_ip_on_launch = false
  tags = {
    Name = var.NAME_SUB_PVT2
  }
}

# resource "aws_subnet" "subnet-private3" {
#   cidr_block              = "10.1.6.0/24"
#   vpc_id                  = aws_vpc.prd-vpc.id
#   availability_zone       = "us-east-1f"
#   map_public_ip_on_launch = false
#   tags = {
#     Name = "wp-subnet-private3-1f"
#   }
# }