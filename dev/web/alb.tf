
resource "aws_lb" "sample1" {
  name               = "terraform-asg"
  load_balancer_type = var.load_balancer_type
  subnets            = data.aws_subnets.subnets.ids
  security_groups    = [aws_security_group.alb-sg.id]
}