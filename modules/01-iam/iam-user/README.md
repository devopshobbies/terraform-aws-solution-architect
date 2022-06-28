##  what should we do to control our users and groups?
you can go and create users, role and groups and also attach policies to them but we recommend to handle users and groups with this two technologies
 - Control Tower 
 - AWS Organization

you can find this sample code too!
```sh
# check the sample code folder
```

we create Roles, Policies and attach them together in some cases, exactly in the terraform code.
for example:

> Note: if you want to attach Role to an Ec2 instance you need to go for iam_instance_profile on aws_instance resource. So for that you need to create a new resource first and then use it.aws_iam_instance_profile
```sh
resource "aws_iam_instance_profile" "s3-bucket-role-instance-profile"{
  name = "s3-bucket-role-instance-profile"
  role = aws_iam_role.{Resource}.{Name}

}

```


```sh
################################
# Eks cluster iam role
################################
resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })


}


resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


```

We can even create password policies to provide better security approaches:

```sh
################################
# Example Password Policy
################################
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

```

And what if we want to get a better view of whats going on with users and activities belong to them ? Well we create an AWS Account Analyzer:

```sh
################################
# Example Account Analyzer Creation
################################
resource "aws_accessanalyzer_analyzer" "example" {
  analyzer_name = "devopshobbies_account_analyzer"
}

```