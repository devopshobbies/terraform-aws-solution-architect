# IAM Module
This Module introduces 2 main components:
  - IAM Users
  - IAM Groups
  - IAM Role
### Requirements
|Name|Version|
|----|-------|
|terraform| >=1.0|
|aws|>=4.0|

### Providers
|Name|Version|
|----|-------|
|aws|>=4.0|

### Modules
None

### Resources
|Name|Type|
|----|----|
|aws_iam_access_key.dvhb|resource|
|aws_iam_user.dvhb|resource|
|aws_iam_user_login_profile.dvhb|resource|
|aws_iam_group.dvhb|resource|
|aws_iam_group_membership.dvhb|resource|

### Inputs
|Name|Description|Type|Default|Required|
|----|-----------|----|-------|--------|
|create_user|Whether to create the IAM user|bool|true|yes|
|create_iam_user_login_profile|Whether to create IAM user login profile|bool|true|no|
|create_iam_access_key|Whether to create IAM access key|bool|true|no|
|password_reset_required|Whether the user should be forced to reset the generated password on first login|bool|false|no|
|username|Username to create|string|n/a|yes|
|group|Group to create|string|n/a|yes|
|path|Path in which to create the user|string|/|yes|
|pgp_key|Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key|string|n/a|no|
|password_length|The length of the generated password|int|20|no|
|tags|A map of tags to add to all resources|string|n/a|no|



### Outputs
|Name|Description|
|----|-------|
|iam_user_name|Created user|
|iam_password|Randomly generated password|
|iam_user_accesskey|print the Access_Key of user if available|
|iam_user_secret|print the Secret_Key of user if available|
|iam_group_name|the group which the user belongs to|
