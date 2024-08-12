check "instance_type_validation" {
  data "tfplan" "instance" {
    resources = "aws_instance"
  }

  assert {
    condition = all tfplan.instance as instance {
      instance.applied.instance_type != "t2.small"
    }
    error_message = "Instance type is 'small'. Continuous validation check failed."
  }

  assert {
    condition = any tfplan.instance as instance {
      instance.applied.instance_type == "t2.medium"
    }
    error_message = "No instance of type 'medium' found. Continuous validation check failed."
  }
}
