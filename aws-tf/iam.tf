resource "aws_iam_instance_profile" "profile" {
  name = "${var.project_name}-ec2-profile"
  role = aws_iam_role.role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "policy" {
  name = "${var.project_name}-ecr-access-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    statement = [
      {
        Action = [
          "ecr:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "attach" {
  name       = "${var.project_name}-attachment"
  roles      = ["{aws_iam_role.role.name}"]
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role" "role" {
  name               = "${var.project_name}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}