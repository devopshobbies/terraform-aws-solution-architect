resource "aws_route53_zone" "hosted_zone_public" {
  name = var.hosted_zone_name

  force_destroy = var.force_destroy
}

resource "aws_route53_record" "route_record" {
  zone_id = aws_route53_zone.hosted_zone_public.zone_id
  name    = "${var.record_name}.${var.hosted_zone_name}"
  
  type    = var.record_type
  ttl     = var.ttl
  records = var.records_list


  # dynamic "alias" {
  #   for_each = length(keys(lookup(each.value, "alias", {}))) == 0 ? [] : [true]

  #   content {
  #     name                   = each.value.alias.name
  #     zone_id                = try(each.value.alias.zone_id, data.aws_route53_zone.this[0].zone_id)
  #     evaluate_target_health = lookup(each.value.alias, "evaluate_target_health", false)
  #   }
  # }

  # dynamic "failover_routing_policy" {
  #   for_each = length(keys(lookup(each.value, "failover_routing_policy", {}))) == 0 ? [] : [true]

  #   content {
  #     type = each.value.failover_routing_policy.type
  #   }
  # }

  # dynamic "latency_routing_policy" {
  #   for_each = length(keys(lookup(each.value, "latency_routing_policy", {}))) == 0 ? [] : [true]

  #   content {
  #     region = each.value.latency_routing_policy.region
  #   }
  # }

  # dynamic "weighted_routing_policy" {
  #   for_each = length(keys(lookup(each.value, "weighted_routing_policy", {}))) == 0 ? [] : [true]

  #   content {
  #     weight = each.value.weighted_routing_policy.weight
  #   }
  # }

  # dynamic "geolocation_routing_policy" {
  #   for_each = length(keys(lookup(each.value, "geolocation_routing_policy", {}))) == 0 ? [] : [true]

  #   content {
  #     continent   = lookup(each.value.geolocation_routing_policy, "continent", null)
  #     country     = lookup(each.value.geolocation_routing_policy, "country", null)
  #     subdivision = lookup(each.value.geolocation_routing_policy, "subdivision", null)
  #   }
  # }
}