resource "aws_lb" "nb-study" {
  load_balancer_type = "application"
  name               = "nb-study"

  security_groups = [aws_security_group.nb-study-alb.id]
  subnets         = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
}

resource "aws_lb_listener" "nb-study-web" {
  load_balancer_arn = aws_lb.nb-study.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nb-study-web.arn
  }
}

resource "aws_lb_target_group" "nb-study-web" {
  name        = "nb-study-web"
  vpc_id      = aws_vpc.nb-study.id
  port        = 3000
  protocol    = "HTTP"
  target_type = "instance"

  health_check {
    path    = "/"
    port    = 3000
    matcher = 200
  }
}

resource "aws_alb_target_group_attachment" "nb-study-public-1a" {
  target_group_arn = aws_lb_target_group.nb-study-web.arn
  target_id        = aws_instance.web_pu1a.id
  port             = 3000
}

resource "aws_alb_target_group_attachment" "nb-study-public-1c" {
  target_group_arn = aws_lb_target_group.nb-study-web.arn
  target_id        = aws_instance.web_pu1c.id
  port             = 3000
}
