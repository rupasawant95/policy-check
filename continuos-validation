continuous_validation_check = rule {
    all ec2_instances as _, instance {
        instance.change.after.instance_type is "t2.small" or instance.change.after.instance_type is "t2.medium"
    }
}

main = rule {
    continuous_validation_check
}
