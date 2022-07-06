resource "aws_lb_target_group" "asg-target-prod" {
  name     = "terraform-asg-target1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
 
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
    
  }
  

}
