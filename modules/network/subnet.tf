# public subnet
data "aws_subnet" "subnet_public_1a" {
  id = "subnet-0f8f316f462ed65a0"
}

data "aws_subnet" "subnet_public_1c" {
  id = "subnet-02fa14095bc1b19c2"
}
data "aws_subnet" "subnet_private_1a" {
  id = "subnet-0c25ef5ebf641e31e"
}

data "aws_subnet" "subnet_private_1c" {
  id = "subnet-083f99e781793ea5b"
}
