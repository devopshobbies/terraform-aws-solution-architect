## Requirements

| Name | Version |
|------|---------|
|terraform| >= 1.0 |
|aws| >= 4.0 |

## Providers

| Name | Version |
|------|---------|
|aws| >= 4.0 |
|template| n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
|aws_eip.ec2-eip| resource |
|aws_eip_association.ec2-eip-association| resource |
|aws_instance.ec2-instance| resource |
|aws_security_group.ec2-sg| resource |
|aws_security_group_rule.allow_all_outbound| resource |
|aws_security_group_rule.allow_ssh_inbound| resource |
|template_file.user_data| data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|ami| Default Amazon Machine Image Type(AMI) | `string` | n/a | yes |
|instance\_name| Default Instance Name | `string` | n/a | yes |
|instance\_type| Default Instance Type | `string` | n/a | yes |
|number\_of\_instances| Numbe of Instances | `number` | `1` | no |
|use\_elastic\_ip| Default Usage of Elastic IP | `bool` | `false` | no |
|use\_user\_data| Use User Data Status | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
|ec2-elastic-address| Elastic ip address |
|ec2-instance-dns| Public DNS of Created EC2-Instance |
|ec2-instance-id| ID of Created EC2-Instance |
|ec2-instance-ipv4| IPV4 of Created EC2-Instance |
|ec2-instance-name| Name of Created EC2-Instance |
|ec2-security-group-id| The EC2 Security Group ID |