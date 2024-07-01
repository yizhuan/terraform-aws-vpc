# Resource: aws_key_pair
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/key_pair

resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-keypair-rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}