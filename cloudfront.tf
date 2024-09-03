resource "aws_cloudfront_distribution" "distribution" {
  origin {
    domain_name = aws_eip.eip.public_dns
    origin_id   = var.NAME_ORIGIN_ID

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "match-viewer"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled         = true
  is_ipv6_enabled = true
  #default_root_object = "index.php"

  aliases = [var.CLOUDFRONT_ALIAS]

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.NAME_ORIGIN_ID
    viewer_protocol_policy = "allow-all"

    cache_policy_id          = "b2884449-e4de-46a7-ac36-70bc7f1ddd6d" # Use Origin Cache Headers
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3" # Managed-AllViewer

    min_ttl    = 0
    default_ttl = 86400
    max_ttl    = 31536000
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.acm-cert.arn
    #acm_certificate_arn      = "arn:aws:acm:us-east-1:598400520484:certificate/9c46209a-f5ad-4916-bee3-421f99af01dc"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2019"
  }

  tags = {
    Name = "wp-distribution"
  }
}
