resource "aws_lb_target_group" "asg-target-dev" {
  name     = "terraform-asg-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
 
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 25
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    
  }
  

}
