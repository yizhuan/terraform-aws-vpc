# Resource: aws_vpc
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}
