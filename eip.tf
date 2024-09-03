resource "aws_eip" "eip" {
  instance = aws_instance.instance.id
  vpc      = true

  tags = {
    Name = var.NAME_EIP
  }
}
