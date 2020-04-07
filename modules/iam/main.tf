

resource "aws_iam_role_policy" "DynamoDB-Policy" {
  name = "${aws_iam_role.lambda-role.name}-Policy"
  role = aws_iam_role.lambda-role.id
  policy = file("${path.module}/dynamodb-policy.json")
}

resource "aws_iam_role" "lambda-role" {
  name = "${var.lambda_name}-Role"
  assume_role_policy = file("${path.module}/lambda-role.json")
}

