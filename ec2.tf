# Resource: aws_instance
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

resource "aws_instance" "my_instance" {
  ami                    = "ami-0b3aef6bc281a13b2"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.my_subnet.id
  key_name               = "my-keypair-rsa"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  tags = {
    Name = "my-vm-1"
  }
}