# IAM Module
This Module introduces one main components:
  - IAM Policy

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
|aws_iam_policy.policy|resource|


### Inputs
|Name|Description|Type|Default|Required|
|----|-----------|----|-------|--------|
| create_policy|Whether to create the IAM policy|bool|true|no|
|description |	The description of the policy |	string |	"IAM Policy" |	no|
|name |	The name of the policy| 	string |	"" |	no|
|path |	The path of the policy in IAM 	|string |	"/" |	no|
|policy 	|The path of the policy in IAM (tpl file) |	string |	""| 	no|
|tags |	A map of tags to add to all resources. 	map(string) |	{}| 	no|



### Outputs
|Name|Description|
|----|-------|
|description |	The description of the policy|
|id 	|The policy's ID|
|name |	The name of the policy|
|path |	The path of the policy in IAM|
|policy |	The policy document|