data "aws_iam_policy_document" "ec2_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "ecs_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
    effect = "Allow"
  }
}

resource "aws_iam_role" "ecs_instance_role" {
    name = format("%s-ecs-instance-role", var.project_name)
    assume_role_policy = data.aws_iam_policy_document.ec2_role.json
}

resource "aws_iam_role" "ecs_service_role" {
    name = format("%s-ecs-service-role", var.project_name)
    assume_role_policy = data.aws_iam_policy_document.ecs_role.json
}

resource "aws_iam_policy_attachment" "ecs_instance_role_attach" {
    name = "ecs-instance-role-attach"
    roles = [aws_iam_role.ecs_instance_role.name]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_policy_attachment" "ecs_service_role_attach" {
    name = "ecs-service-role-attach"
    roles = [aws_iam_role.ecs_service_role.name]
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_instance_profile" "ecs" {
    name = "ecs-instance-profile"
    path = "/"
    role = aws_iam_role.ecs_instance_role.name
}
