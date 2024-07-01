# Resource: aws_networkfirewall_firewall
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall

resource "aws_networkfirewall_firewall" "my_firewall" {
  name                = "my-firewall"
  firewall_policy_arn = aws_networkfirewall_firewall_policy.my_firewall_policy.arn
  vpc_id              = aws_vpc.my_vpc.id

  subnet_mapping {
    subnet_id = aws_subnet.my_subnet.id
  }
}

resource "aws_networkfirewall_firewall_policy" "my_firewall_policy" {
  name = "my-firewall-policy"

  firewall_policy {
    stateless_rule_group_reference {
      resource_arn = aws_networkfirewall_rule_group.my_firewall_rule_group.arn
      priority     = 1
    }

    stateless_default_actions          = ["aws:forward_to_sfe"]
    stateless_fragment_default_actions = ["aws:forward_to_sfe"]
  }
}

resource "aws_networkfirewall_rule_group" "my_firewall_rule_group" {
  capacity = 100
  name     = "my-rule-group"
  type     = "STATELESS"

  rule_group {
    rules_source {
      stateless_rules_and_custom_actions {
        stateless_rule {
          rule_definition {
            actions = ["aws:pass"]
            match_attributes {
              source {
                address_definition = "0.0.0.0/0"
              }
              destination {
                address_definition = var.private_subnet_cidr_block
              }
              protocols = [6] # TCP
            }
          }
          priority = 1
        }
      }
    }
  }
}