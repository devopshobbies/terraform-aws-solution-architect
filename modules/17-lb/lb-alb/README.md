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
|aws_lb.lb| resource |
|aws_lb_listener.lb_listener| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|alb\_name| The Name To Use For This ALB | `string` | n/a | yes |
|security\_group\_id| The Security Group | `any` | n/a | yes |
|subnet\_ids| The Subnet IDs To Deploy | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
|alb\_dns\_name| The Domain Name of The Load Balancer |
|alb\_http\_listener\_arn| The ARN of The HTTP Listener |