locals {
  ingress_rules = [{
    port        = 443
    description = "Ingress rules for port 443"
    protocol    = "tcp"
    },
    {
      port        = 80
      description = "Ingree rules for port 80"
      protocol    = "tcp"

    },
    {
      port        = -1
      description = "ICMP PROTOCOL"
      protocol    = "icmp"

    },

    {
      port        = 22
      description = "SSH"
      protocol    = "tcp"

    },
  ]
}

locals {
  egress_rules = [{
    port     = 0
    protocol = "-1"
    }
  ]
}
