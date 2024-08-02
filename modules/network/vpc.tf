data "aws_vpc" "poc_vpc" {
  id = data.aws_subnet.subnet_public_1a.vpc_id
}
