resource "aws_launch_template" "TG01-EC2-Template" {
  name_prefix   = "TG01-EC2-Template"
  description   = "TG01-EC2-Template"
  image_id      = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name      = "basiclinux"

  vpc_security_group_ids = [aws_security_group.ASG01-TG01.id]

  user_data = filebase64("brazil.sh")

  tags = {
    Name = "TG01-EC2-Template"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_template" "MultiApp-443-Template" {
  name_prefix   = "MultiApp-443-Template"
  description   = "MultiApp-443-Template"
  image_id      = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  key_name      = "basiclinux"

  vpc_security_group_ids = [aws_security_group.ASG01_TG02.id]

  user_data = filebase64("japan.sh")

  tags = {
    Name = "MultiApp-443-Template"
  }

  lifecycle {
    create_before_destroy = true
  }
}