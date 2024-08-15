module "domain" {
  source = "../../modules/route53/zones"
}

module "certificate_manager" {
  source = "../../modules/certificate_manager/zones"
}
