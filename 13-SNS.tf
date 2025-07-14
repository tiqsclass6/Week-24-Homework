resource "aws_sns_topic" "ASG01-LB01_SNS_updates" {
  name = "user-updates-topic"
}
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.ASG01-LB01_SNS_updates.arn
  protocol  = "email"
  endpoint  = "daquietstorm22@gmail.com"
}

resource "aws_sns_topic_subscription" "sms_subscription" {
  topic_arn = aws_sns_topic.ASG01-LB01_SNS_updates.arn
  protocol  = "sms"
  endpoint  = "+16196060243"
}