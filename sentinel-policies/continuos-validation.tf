check "instance_type_validation" {
  data "aws" "instance" {
    resources = "aws_instance"
  }

  assert {
    condition     = all aws.instance as instance { instance.applied.instance_type != "t2.small" }
    error_message = "Instance type is 'small'. Validation check failed."
  }

  assert {
    condition     = any aws.instance as instance { instance.applied.instance_type == "t2.medium" }
    error_message = "No instance of type 'medium' found. Validation check failed."
  }
}
