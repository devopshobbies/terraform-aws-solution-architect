resource "aws_route53_zone" "hosted_zone_public" {
  name = var.hosted_zone_name

  force_destroy = var.force_destroy
}

resource "aws_route53_record" "route_record" {
  for_each = { for k, v in var.config_list : k => v}

  zone_id = aws_route53_zone.hosted_zone_public.zone_id
  name    = "${each.value.record_name}.${each.value.hosted_zone_name}"
  
  type    = each.value.record_type
  ttl     = each.value.ttl
  records = try(each.value.records_list, null)
  set_identifier = try(each.value.identifier, null)
  health_check_id = lookup(each.value, "health_check_id", null)

  dynamic "failover_routing_policy" {
    for_each = var.routing_policy_type == "failover" ? [true] : []

    content {
      type = each.value.failover_routing_policy.type
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = var.routing_policy_type == "weighted" ? [true] : []

    content {
      weight = each.value.weighted_routing_policy.weight
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.routing_policy_type == "geolocation" ? [true] : []

    content {
      continent   = lookup(each.value.geolocation_routing_policy, "continent", null)
      country     = lookup(each.value.geolocation_routing_policy, "country", "*")
    }
  }
}