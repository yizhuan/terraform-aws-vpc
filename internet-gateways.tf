# Resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "my_internet_gw" {
  vpc_id = aws_vpc.my_vpc.id
}
