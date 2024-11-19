# Creating External LoadBalancer (ALB)
resource "aws_lb" "external_alb" {
  name               = "external-lb"  # Ensure name contains only lowercase letters, numbers, and hyphens
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  enable_deletion_protection = false

  # Define idle timeout in seconds
  idle_timeout = 3600  # 60 minutes

}

# Creating Target Group for the LoadBalancer
resource "aws_lb_target_group" "target_elb" {
  name     = "alb-tg"  # Ensure target group names follow Terraform's naming conventions
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demovpc.id

  health_check {
    path                = "/index.html"  
    protocol            = "HTTP"
    interval            = 30   
    timeout             = 5    
    healthy_threshold   = 3    
    unhealthy_threshold = 3    
  }
}
# Attaching first EC2 instance to the target group
resource "aws_lb_target_group_attachment" "attachment_1" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.demoinstance[1].id  # Single instance, no index needed
  port             = 80
}

# Attaching second EC2 instance to the target group
resource "aws_lb_target_group_attachment" "attachment_2" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.demoinstance[0].id
  port             = 80
}

# Creating a Listener for the LoadBalancer
resource "aws_lb_listener" "external_elb" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = 80
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_elb.arn
  }
}
