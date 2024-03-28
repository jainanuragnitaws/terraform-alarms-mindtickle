provider "aws" {
  region = var.primary_region
}


#below resource block is to create an AWA SQS

resource "aws_sqs_queue" "example" {
  name                       = var.queue_name
  delay_seconds              = 90
  max_message_size           = 2048
  message_retention_seconds  = 86400
  visibility_timeout_seconds = 600
}

#below resource block would create an SNS topic
resource "aws_sns_topic" "example" {
  name = var.sns_topic_name
}

#below resource block would create an SNS topic email subscrption endpoint on the above created SNS to send alarms over email.
resource "aws_sns_topic_subscription" "example_email_subscription" {
  topic_arn = aws_sns_topic.example.arn
  protocol  = "email"
  endpoint  = var.endpoint_email # variable to put email address
}