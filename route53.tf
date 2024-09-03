# route53.tf

resource "aws_route53_record" "domain_cname" {
  zone_id = "Z07356691FQK83M5IG1TT"
  name    = var.NAME_DOMAIN
  type    = "CNAME"
  ttl     = 60
  records = [aws_cloudfront_distribution.distribution.domain_name]
}