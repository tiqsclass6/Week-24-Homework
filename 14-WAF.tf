resource "aws_wafv2_web_acl" "Virginia_acl" {
  name        = "Virginia_acl"
  description = "Virginia_acl"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  rule {
    name     = "AWS-Managed-Core-Rule-Set"
    priority = 1
    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "Virginia_acl"
    sampled_requests_enabled   = true
  }
}

resource "aws_wafv2_web_acl_association" "Virginia_acl_association" {
  resource_arn = aws_lb.ASG01-LB01.arn
  web_acl_arn  = aws_wafv2_web_acl.Virginia_acl.arn
}