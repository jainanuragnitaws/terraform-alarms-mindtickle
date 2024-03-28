#below varible is to get the input from user in which region are resources needs to be created
variable "primary_region" { }

#below variable is to provide the SQS queue name to be created
variable "queue_name" {}

#below is the sns topic name variable
variable "sns_topic_name" {
  default = "example-test-topic"
}
#below variable is for the datapoint evaluation period
variable "visible_evaluation_periods" {
  default = "1"
}

#below variable is for the duration of the datapoints to be considered
variable "visible_period" {
  default = "10"
}

#below variable is for threshold above which alarm would be triggered
variable "visible_threshold" {
  default = "1"
}

#below variable is for the datapoint evaluation period
variable "oldest_evaluation_periods" {
  default = "1"
}

#below variable is for the duration of the datapoints to be considered
variable "oldest_period" {
  default = "10"
}

#below variable is for threshold above which alarm would be triggered
variable "oldest_threshold" {
  default = "1"
}
#below variable is to proivde endpoint for the email
variable "endpoint_email" {
  default = "jainanurag.nitsxr@gmail.com"
}