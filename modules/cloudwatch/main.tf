resource "aws_cloudwatch_log_group" "app_logs" {
  name = "/aws/ecs/my-app-logs"
  retention_in_days = 14
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name                = "high-cpu-alarm"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 80
  alarm_description         = "This metric monitors EC2 CPU utilization."
  insufficient_data_actions = []
}
