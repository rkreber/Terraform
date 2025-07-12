resource "aws_budgets_budget" "ec2" {
  name              = "${var.project_name}-ec2-budget-tracker"
  budget_type       = "COST"
  limit_amount      = var.ec2_budget_limit
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.email_address]
  }

  tags = {
    Name = "${var.project_name}-ec2-budget-tracker"
  }
}