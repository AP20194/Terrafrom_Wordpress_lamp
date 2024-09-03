output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.distribution.domain_name
}

output "acm_certificate_arn" {
  value = aws_acm_certificate.acm-cert.arn
}
