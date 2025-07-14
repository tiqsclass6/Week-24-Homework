data "aws_route53_zone" "main" {
  name         = "theinternationalquietstorm.com"
  private_zone = false
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "theinternationalquietstorm.com"
  type    = "A"

  alias {
    name                   = aws_lb.ASG01-LB01.dns_name
    zone_id                = aws_lb.ASG01-LB01.zone_id
    evaluate_target_health = true
  }
}