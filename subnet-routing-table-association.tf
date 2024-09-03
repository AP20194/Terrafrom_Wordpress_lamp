resource "aws_route_table_association" "rt-subnet-1a" {
  subnet_id      = aws_subnet.subnet-public1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt-subnet-1b" {
  subnet_id      = aws_subnet.subnet-public2.id
  route_table_id = aws_route_table.rt.id
}

# resource "aws_route_table_association" "rt-subnet-1c" {
#   subnet_id      = aws_subnet.wp-subnet-public3-1c.id
#   route_table_id = aws_route_table.wp-rt.id
# }