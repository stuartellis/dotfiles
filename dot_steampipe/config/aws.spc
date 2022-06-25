connection "aws_account_sel_np" {
  plugin  = "aws"
  profile = "sel-np"
  regions = ["us-*", "eu-*"]
}

connection "aws_account_se_origin" {
  plugin  = "aws"
  profile = "se-origin"
  regions = ["us-*", "eu-*"]
}

connection "aws_all" {
  plugin      = "aws" 
  type        = "aggregator"
  connections = ["aws_account_sel_np", "aws_account_se_origin"]
}

