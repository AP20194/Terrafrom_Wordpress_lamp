resource "aws_acm_certificate" "acm-cert" {
  domain_name       = var.NAME_DOMAIN
  validation_method = "DNS"
  tags = {
    Name = var.NAME_ACM
  }
}

resource "aws_route53_record" "acm-cert-validation" {
  for_each = {
    for dvo in aws_acm_certificate.acm-cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id = data.aws_route53_zone.every1lending_zone.zone_id
  name    = each.value.name
  type    = each.value.type
  ttl     = 60
  records = [each.value.record]
}

resource "aws_acm_certificate_validation" "acm-cert-validation" {
  certificate_arn         = aws_acm_certificate.acm-cert.arn
  validation_record_fqdns = [for record in aws_route53_record.acm-cert-validation : record.fqdn]
}

data "aws_route53_zone" "every1lending_zone" {
  name = var.aws_route53_zone
}
