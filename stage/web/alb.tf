
resource "aws_lb" "example1" {
  name               = "terraform-asg-example"
  load_balancer_type = var.load_balancer_type
  subnets            = data.aws_subnets.subnets.ids
  security_groups    = [aws_security_group.alb.id]
}