locals {
  http_port    = 80
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}

resource "aws_vpc" "vpc" {
  count = var.create_vpc ? 1 : 0

  cidr_block = var.cidr

  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

}

resource "aws_security_group" "instance" {
  name   = "${var.name}-instance"
  vpc_id = aws_vpc.vpc[0].id
}

resource "aws_security_group_rule" "allow_server_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.instance.id

  from_port   = local.http_port
  to_port     = local.http_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips
}

resource "aws_security_group_rule" "allow_server_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.instance.id

  from_port   = local.any_port
  to_port     = local.any_port
  protocol    = local.tcp_protocol
  cidr_blocks = local.all_ips
}

resource "aws_internet_gateway" "igw" {
  count = var.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc[0].id

}

# ---------------------------------------------------------------------------------------------------------------------
# Public Routes
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "public" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc[0].id

}

resource "aws_route" "public_internet_gateway" {
  count = var.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0

  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[0].id

  timeouts {
    create = "5m"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Private Routes
# There Are As Many Routing Tables As The Number of NAT Gateways
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "private" {
  count = var.create_vpc && length(var.private_subnets) > 0 ? local.nat_gateway_count : 0

  vpc_id = aws_vpc.vpc[0].id

}

# ---------------------------------------------------------------------------------------------------------------------
# Public Subnet
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "public" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  vpc_id     = aws_vpc.vpc[0].id
  cidr_block = element(var.public_subnets, count.index)

}

# ---------------------------------------------------------------------------------------------------------------------
# Private Subnet
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_subnet" "private" {
  count = var.create_vpc && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  vpc_id     = aws_vpc.vpc[0].id
  cidr_block = element(var.private_subnets, count.index)
}

# ---------------------------------------------------------------------------------------------------------------------
# NAT Gateway
# ---------------------------------------------------------------------------------------------------------------------

locals {
  nat_gateway_count = var.single_nat_gateway ? 1 : length(var.private_subnets)
  nat_gateway_ips   = try(aws_eip.nat[*].id, [])
}

resource "aws_eip" "nat" {
  count = var.create_vpc && var.enable_nat_gateway ? local.nat_gateway_count : 0

  vpc = true

}

resource "aws_nat_gateway" "nat_gateway" {
  count = var.create_vpc && var.enable_nat_gateway ? local.nat_gateway_count : 0

  allocation_id = element(
    local.nat_gateway_ips,
    count.index,
  )
  subnet_id = element(
    aws_subnet.public[*].id,
    count.index,
  )

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "private_nat_gateway" {
  count = var.create_vpc && var.enable_nat_gateway ? local.nat_gateway_count : 0

  route_table_id         = element(aws_route_table.private[*].id, count.index)
  destination_cidr_block = var.nat_gateway_destination_cidr_block
  nat_gateway_id         = element(aws_nat_gateway.nat_gateway[*].id, count.index)

  timeouts {
    create = "10m"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# Route Table Association
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_route_table_association" "private" {
  count = var.create_vpc && length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  subnet_id = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(
    aws_route_table.private[*].id,
    var.single_nat_gateway ? 0 : count.index,
  )
}

resource "aws_route_table_association" "public" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? length(var.public_subnets) : 0

  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public[0].id
}