#below resource block is to create an AWS cloud watch alarm on the SQS for the number of visible messages breaching a threshold value

resource "aws_cloudwatch_metric_alarm" "sqs_approximate_number_of_messages_visible_alarm" {
  alarm_name          = "SQSApproximateNumberOfMessagesVisible-${var.queue_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.visible_evaluation_periods #this is the evaluation period of the metric datapoints
  metric_name         = "ApproximateNumberOfMessagesVisible"
  namespace           = "AWS/SQS"
  period              = var.visible_period #this is the duration in which datapoints would be considered.
  statistic           = "Average"
  threshold           = var.visible_threshold #this is the threshold value above which alarm would be triggered
  alarm_description   = "Alarm when SQS ApproximateNumberOfMessagesVisible exceeds threshold value defined"
  alarm_actions       = [aws_sns_topic.example.arn] # this will fetch the arn of the SNS to be configured with the alarm to send the email
  dimensions = {
    QueueName = aws_sqs_queue.example.name
  }
}

#below resource block is to create an AWS cloud watch alarm on the SQS for a message to be in the SQS duration or age of a message
resource "aws_cloudwatch_metric_alarm" "sqs_approximate_age_of_oldest_message_alarm" {
  alarm_name          = "SQSApproximateAgeOfOldestMessage-${var.queue_name}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.oldest_evaluation_periods #this is the evaluation period of the metric datapoints
  metric_name         = "ApproximateAgeOfOldestMessage"
  namespace           = "AWS/SQS"
  period              = var.oldest_period #this is the duration in which datapoints would be considered.
  statistic           = "Average"
  threshold           = var.oldest_threshold #this is the threshold value above which alarm would be triggered
  alarm_description   = "Alarm when SQS ApproximateAgeOfOldestMessage exceeds threshold minutes"
  alarm_actions       = [aws_sns_topic.example.arn] # this will fetch the arn of the SNS to be configured with the alarm to send the email
  dimensions = {
    QueueName = aws_sqs_queue.example.name
  }
}