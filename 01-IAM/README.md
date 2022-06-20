### what should you do
you can go and create users, role and groups and also attach policies to them but we recommend to handle users and groups with this two technologies
 - Control Tower 
 - AWS Organization


we create Roles, Policies and attach them together in some cases, exactly in the terraform code.
for example:
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