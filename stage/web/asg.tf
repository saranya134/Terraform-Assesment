resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = data.aws_subnets.subnets.ids
  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"
 
  name                 = "asg-stage"
  min_size = 1
  max_size = 2

  instance_refresh {
    strategy = "Rolling"
   # triggers = ["launch_configuration"]
    preferences {
      min_healthy_percentage = 50
    }
  }

 
  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
 
}
}
resource "aws_autoscaling_policy" "Terraform-ASG-Policy" {
  name                   = "ASG-UpScalingPOLICY"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.example.name
  policy_type            ="SimpleScaling"

}

resource "aws_cloudwatch_metric_alarm" "CloudwatchforASG" {
  alarm_name          = "Terraform-ASG-UpScaling-Alarm"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.example.name
  }

  alarm_actions     = [aws_autoscaling_policy.Terraform-ASG-Policy.arn]
}

  
// Below code is for ASG-Desacling policy
resource "aws_autoscaling_policy" "Terraform-ASG-DPolicy" {
  name                   = "ASG-Descaling-POLICY"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.example.name
  policy_type            ="SimpleScaling"

}

resource "aws_cloudwatch_metric_alarm" "CloudwatchforDASG" {
  alarm_name          = "Terraform-ASG-Descaling-Alarm"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.example.name
  }

  alarm_actions     = [aws_autoscaling_policy.Terraform-ASG-DPolicy.arn]
}
