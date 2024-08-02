data "aws_acm_certificate" "rpa_vt_lab_opetech_jp" {
  domain   = "rpa.vt-lab.opetech.jp"
  statuses = ["ISSUED"]
}
