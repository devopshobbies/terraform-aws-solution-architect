## Requirements

| Name | Version |
|------|---------|
|terraform| >= 1.0 |
|aws| >= 4.0 |

## Providers

| Name | Version |
|------|---------|
|aws| >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
|aws_route53_record.route_record| resource |
|aws_route53_zone.hosted_zone_public| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|config\_list| List of Configs For Route53 Resource | `any` | n/a | yes |
|force\_destroy| Whether To Destroy All Records (Possibly Managed Outside Of Terraform) In The Zone When Destroying The Zone | `bool` | `false` | no |
|hosted\_zone\_name| This Is The Name of The Hosted Zone | `string` | `"testterrafromhostedzone.com"` | no |
|record\_name| The Name of The Record | `string` | `"test"` | no |
|record\_type| The Record Type. Valid Values Are 'A', 'Aaaa', 'Caa', 'Cname', 'Mx', 'Naptr', 'Ns', 'Ptr', 'Soa', 'Spf', 'Srv' And 'Txt' | `string` | `"A"` | no |
|records\_list| List of Records | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
|routing\_policy\_type| The Type of Routing Policy | `string` | `""` | no |
|ttl| The TTL of The Record | `number` | `300` | no |

## Outputs

| Name | Description |
|------|-------------|
|route-record-name| Route53 Record Name |
|route-record-ttl| Route53 TTL |
|route-records| Route53 Records |