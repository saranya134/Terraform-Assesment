
resource "aws_lb" "sample2" {
  name               = "terraform-asg1"
  load_balancer_type = var.load_balancer_type
  subnets            = data.aws_subnets.subnets.ids
  security_groups    = [aws_security_group.alb-sg1.id]
}