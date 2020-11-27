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
    path = "/"
    assume_role_policy = data.aws_iam_policy_document.ec2_role.json
}

resource "aws_iam_role" "ecs_service_role" {
    name = format("%s-ecs-service-role", var.project_name)
    assume_role_policy = data.aws_iam_policy_document.ecs_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
    role = aws_iam_role.ecs_instance_role.name
}

resource "aws_iam_role_policy_attachment" "ecs_service_role_attach" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
    role = aws_iam_role.ecs_service_role.name
}

resource "aws_iam_role_policy_attachment" "ecs-instance-role-attach-ssm" {
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
    role = aws_iam_role.ecs_instance_role.name
}

resource "aws_iam_role_policy_attachment" "ecs-instance-role-attach-ssm2" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    role = aws_iam_role.ecs_instance_role.name
}


resource "aws_iam_instance_profile" "ecs" {
    name = format("%s-ecs-instance-profile", var.project_name)
    path = "/"
    role = aws_iam_role.ecs_instance_role.name
}
