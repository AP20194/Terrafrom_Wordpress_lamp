resource "aws_security_group" "securitygroup" {
  name        = var.NAME_SG
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.prd-vpc.id
  tags = {
    Name = var.NAME_SG
  }
}

resource "aws_vpc_security_group_egress_rule" "wp_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "wp_allow_http_ipv4" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "wp_allow_https_ipv4" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "wp_allow_ssh_ipv4" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "wp_allow_mysql_ipv4" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}

resource "aws_vpc_security_group_ingress_rule" "wp_allow_ftp_ipv4" {
  security_group_id = aws_security_group.securitygroup.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 21
  ip_protocol       = "tcp"
  to_port           = 21
}