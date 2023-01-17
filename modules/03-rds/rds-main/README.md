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
|aws_db_instance.db_instance| resource |
|aws_db_parameter_group.db_param| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|allocated\_storage| Allocated Storage For DB Instance In GB | `number` | `5` | no |
|allow\_major\_version\_upgrade| Indicates That Major Version Upgrades Are Allowed | `bool` | `false` | no |
|apply\_immediately| Specifies Whether Any Database Modifications Are Applied Immediately, Or During The Next Maintenance Window | `string` | `"8.0.30"` | no |
|apply\_method| (Optional) 'immediate' (Default), Or 'pending-reboot'. Some Engines Can'T Apply Some Parameters Without A Reboot, And You Will Need To Specify 'pending-reboot' Here | `string` | `"immediate"` | no |
|auto\_minor\_version\_upgrade| Indicates That Minor Engine Upgrades Will Be Applied Automatically To The DB Instance During The Maintenance Window | `bool` | `true` | no |
|availability\_zone| RDS Availability Zone | `string` | `null` | no |
|backup\_retention\_period| The Days To Retain Backups For. Must Be Between 0 And 35 | `number` | `0` | no |
|blue\_green\_update| Enables Low-Downtime Updates Using RDS's Blue/Green Deployments | `bool` | `false` | no |
|create\_db\_param| Specifies Whether DB Parameter Group Is Created | `bool` | `false` | no |
|deletion\_protection| If The DB Instance Should Have Deletion Protection Enabled | `bool` | `false` | no |
|engine| The Database Engine To Use | `string` | `"mysql"` | no |
|engine\_version| The Engine Version To Use | `string` | `"8.0.30"` | no |
|family| The Family Of The DB Parameter Group | `string` | `"mysql8.0"` | no |
|identifier| The Name of The RDS Instance | `string` | n/a | yes |
|instance\_class| The Instance Type of The RDS Instance | `string` | n/a | yes |
|max\_allocated\_storage| When Configured, The Upper Limit To Which Amazon RDS Can Automatically Scale The Storage of The DB Instance | `number` | `10` | no |
|multi\_az| Specifies If The RDS Instance Is Multi-Az | `bool` | `false` | no |
|parameters| Parameter Group | `list(map(string))` | `[]` | no |
|password| Password For The Master DB User | `string` | `null` | no |
|publicly\_accessible| Bool To Control If Instance Is Publicly Accessible | `bool` | `false` | no |
|replicate\_source\_db| Specifies That This Resource Is A Replicate Database, And To Use This Value As The Source Database | `string` | `null` | no |
| skip\_final\_snapshot| Determines Whether A Final Db Snapshot Is Created Before The Db Instance Is Deleted.<br>  If True Is Specified, No Dbsnapshot Is Created.<br>  If False Is Specified, A Db Snapshot Is Created Before The Db Instance Is Deleted | `bool` | `false` | no |
|storage\_encrypted| Specifies Whether The DB Instance Is Encrypted | `bool` | `false` | no |
|username| Username For The Master DB User | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
|rds-vol-address| RDS Volume Address |
|rds-vol-engine| RDS Volume Engine |
|rds-vol-engine-version| RDS Volume Engine Version |
|rds-vol-id| RDS Volume ID |
|rds-vol-name| RDS Volume Name |
|rds-vol-replica-mode| RDS Volume Replica Mode |
|rds-vol-replica-source-db| RDS Volume Source DB |
|rds-vol-replicas| RDS Volume Replicas |