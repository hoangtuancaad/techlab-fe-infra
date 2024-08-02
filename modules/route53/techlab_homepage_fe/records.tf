resource "aws_route53_record" "www" {
  zone_id = var.domain_rpa_vt_lab_opetech_jp_zone_id
  name    = "techlab-homepage.${var.domain_rpa_vt_lab_opetech_jp_name}"
  type    = "A"
  # ttl     = "300"

  alias {
    name                   = var.techlab_homepage_lb_dns_name
    zone_id                = var.techlab_homepage_lb_zone_id
    evaluate_target_health = true
  }
}
