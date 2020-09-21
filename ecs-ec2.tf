data "aws_ami" "ecs" {
  most_recent = true
  filter {
    name = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

resource "aws_launch_configuration" "instance" {
  name_prefix          = var.project_name
  image_id             = data.aws_ami.ecs.id
  instance_type          = "t3.nano"
  iam_instance_profile   = aws_iam_instance_profile.ecs.name 
  user_data              = data.template_file.user_data.rendered
  security_groups = [aws_security_group.test_security_group.id]
  key_name               = var.ec2_keypair
  

  root_block_device {
    volume_size = "30"
    volume_type = "gp2"
    delete_on_termination = "true"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "asg" {
  name = format("%s-asg", var.project_name)

  launch_configuration = aws_launch_configuration.instance.name
  vpc_zone_identifier  = [aws_subnet.test_subnet.id]
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1

  health_check_grace_period = 300
  health_check_type         = "EC2"

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "user_data" {
  template = file("user_data.tpl")
  vars = {
    # ここでcluster.nameを使うと循環参照
    cluster_name = var.cluster_name
  }
}
