resource "aws_iam_user" "masterad" {
    name = "eggman"
    tags = {
      Description = "Master Lead"
    }
}
resource "aws_iam_policy" "master" {
  name = "master"
  policy = <<EOF
  {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    EOF
}
resource "aws_iam_user_policy_attachment" "eggman-admin-access" {
    user = aws_iam_user.masterad.name
    policy_arn = aws_iam_policy.master.arn
}
